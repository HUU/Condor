PYTHON_PROJECTS := $(shell find . -name 'pyproject.toml' -not -path "./lib/generated/*" -exec dirname {} \;)
DART_PROJECTS := $(shell find . -name 'pubspec.yaml' -not -path "./lib/generated/*" -exec dirname {} \;)

.PHONY: dart_api_client generate_openapi_spec lint format

dart_api_client: generate_openapi_spec
	tools/openapi-generator/generate.sh -i /tmp/openapi.json -o lib/generated/backend-api-client -n backend_api_client

generate_openapi_spec:
	cd apps/backend && poetry run python tools/save-openapi.py --out /tmp/openapi.json api:app

lint: $(addprefix __pylint_,$(PYTHON_PROJECTS)) $(addprefix __dartlint_,$(DART_PROJECTS))
	@echo "🪮  \033[1;31mLinting shell scripts\033[0m"
	pnpm shellcheck $(shell find . -name '*.sh' -not -path "./lib/generated/*" -not -path "./.husky/_/*" -not -name "flutter_export_environment.sh")
	@echo "🪮  \033[1;31mLinting config files\033[0m"
	pnpm prettier --check '**/*.(md|yml|json)'
	@echo "🪮  \033[1;31mSpell checker\033[0m"
	pnpm cspell . --gitignore --no-progress

format: $(addprefix __pyformat_,$(PYTHON_PROJECTS)) $(addprefix __dartformat_,$(DART_PROJECTS))
	@echo "📝  \033[1;31mFormat config files\033[0m"
	pnpm prettier --write '**/*.(md|yml|json)'

__pylint_./%:
	@echo "🪮  \033[1;31mLinting $*\033[0m"
	cd $* && poetry run flake8 && poetry run black --quiet --check . && poetry run isort -c .

__pyformat_./%:
	@echo "📝  \033[1;31mFormat $*\033[0m"
	cd $* && poetry run black --quiet . && poetry run isort .

__dartlint_./%:
	@echo "🪮  \033[1;31mLinting $*\033[0m"
	cd $* && dart analyze

__dartformat_./%:
	@echo "📝  \033[1;31mFormat $*\033[0m"
	cd $* && dart fix --apply
