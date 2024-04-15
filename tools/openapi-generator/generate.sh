#!/usr/bin/env bash
# https://google.github.io/styleguide/shellguide.html

set -e
set -o nounset

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null; pwd -P )"
declare -r SCRIPT_PATH

declare -r SPEC_HASH_FILE=".openapi-spec-hash"

function _check_required_programs() {

    for p in "${@}"; do
      hash "${p}" 2>&- || \
          { echo >&2 " Required program \"${p}\" not installed or in search PATH.";
            exit 1; }
    done

}

function usage() {
  cat <<EOF
Usage: $0 -i [input_spec] -o [output_dir] -n [pubspec package name]
EOF
}

function run_generator() {
  local -r input_spec_path="$1"
  local -r output_dir_path="$2"
  local -r pub_name="$3"

  java -jar "${SCRIPT_PATH}/openapi-generator-cli.jar" generate \
    -o "${output_dir_path}" \
    -i "${input_spec_path}" \
    -g "dart-dio" \
    --additional-properties "allowUnicodeIdentifiers=false,ensureUniqueParams=true,useEnumExtension=true,enumUnknownDefaultCase=false,prependFormOrBodyParameters=false,pubAuthor=Griblet,pubName=${pub_name},legacyDiscriminatorBehavior=true,sortModelPropertiesByRequiredFlag=true,sortParamsByRequiredFlag=true,wrapper=none"
}

# the generated client needs to format, download deps, and run build_runner (that's Dart's codegen tool which is needed
# because the open API client makes use of BuiltValue / json_serializable which generate yet more sources )
function finish_codegen() {
  local output_dir_path="$1"
  (
    cd "$output_dir_path"
    dart format .
    dart fix --apply
    dart pub get
    dart run build_runner build --delete-conflicting-outputs
  )
}

function main() {

  local input=''
  local output=''
  local pub_name=''
  local verify_updated=FALSE

  while builtin getopts "o:i:n:hv" opt; do

      case $opt in
        i) input="${OPTARG}" ;;
        o) output="${OPTARG}" ;;
        n) pub_name="${OPTARG}" ;;
        v) verify_updated=TRUE ;;
        h) usage; exit 0
          ;;
        \?)
        usage
        exit 1
          ;;
        :)
          echo "required argument not found for option -${OPTARG}" >&2
          usage
          exit 1
          ;;
      esac
  done

  if [[ -z "${input}" ]]; then
    echo "must specify an input OpenAPI spec with -i"
    usage
    exit 1
  fi

  if [[ -z "${output}" ]]; then
    echo "must specify an output directory for codegen with -o"
    usage
    exit 1
  fi

  if ! $verify_updated && ([[ -z "${pub_name}" ]] || ! echo "${pub_name}" | grep -E -q '^[a-z0-9_]+$'); then
    echo "must specify a pubspec package name made of lowercase letters, numbers, or _ with -n"
    usage
    exit 1
  fi

  local -r spec_hash_path="${output}/${SPEC_HASH_FILE}"
  local -r spec_hash=$(md5 -q "${input}")

  if test -f "${spec_hash_path}" && [[ $(< "${spec_hash_path}") == "${spec_hash}" ]]; then
    echo "openapi spec has not changed"
    exit 0
  fi

  if $verify_updated; then
    echo "openapi spec has changed, you need to regenerate the client."
    exit 1
  fi

  run_generator "${input}" "${output}" "${pub_name}"
  finish_codegen "${output}"
  echo "${spec_hash}" > "${spec_hash_path}"
  exit 0
}

_check_required_programs java dart
main "$@"
