from collections import defaultdict
import subprocess
import sys

if len(sys.argv) <= 1:
    print("Usage: depcheck.py <path to project> <path to project> ...")
    sys.exit(1)

def get_packages_for(project_root_dir):
    raw_output = subprocess.check_output(
        ["poetry", "-C", project_root_dir, "show", "--no-ansi", "--no-interaction"]
    )
    return {
        str(package, encoding="utf-8"): str(version, encoding="utf-8")
        for (package, version, *_) in map(lambda s: s.split(), raw_output.splitlines())
    }


all_packages = defaultdict(set)

for path in sys.argv[1:]:
    try:
        for key, value in get_packages_for(path).items():
            all_packages[key].add(value)
    except subprocess.CalledProcessError as e:
        print(
            f"Calling `poetry show` in {path} failed which probably means `poetry.lock` is out of date."
        )
        exit(1)


should_fail = False
for key, value in all_packages.items():
    if len(value) > 1:
        print(f"{key} has multiple versions: {value}")
        should_fail = True

if should_fail:
    sys.exit(1)
else:
    sys.exit(0)
