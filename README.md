# Condor

Proof-of-concept Flutter + FastAPI monorepo showing how to structure a modularized project and use OpenAPI specs to
generate always up-to-date API clients.

## Prerequisites

- Java 11 (should come with macOS)
- Install homebrew, see <https://brew.sh/>
- Install ASDF (tool for downloading language runtimes and SDKs, sandboxing them to specific directories, all controlled
  with `.tool-versions`)
  - `brew install asdf`
  - Add `. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh` to `~/.profile` or `~/.zshrc`
- Install Python 3
  - `brew install python`
  - Add `export PATH="$(brew --prefix python)/libexec/bin:$PATH` to `~/.profile` or `~/.zshrc`
- Mobile development prerequisites
  - XCode (instructions TODO)
  - Android Studio (instructions TODO)

## Setup

- Install required ASDF plugins: `cat .tool-versions | cut -d' ' -f1 | grep "^[^\#]" | xargs -i asdf plugin add  {}`
- Install required tools/SDKs: `asdf install`

## API Changes

Whenever you change the API exposed by the backend, you must regenerate the API client. If you forget to do this,
git pre-commit hooks will stop you.

```sh
make dart_api_client
```

It's generally a good idea to make sure everything still compiles afterward

```sh
make lint
```

## Other Tools

This repo uses `make` to provide and manage all scripts and tools. Generally the idea is that each project will use
the language and framework-specific tools unadulterated (i.e. `flutter` and `poetry`) for ease of development, and then
anything custom is build rule in a `Makefile`. The key tools to know about:

- `make lint` -- runs all linters across the project (i.e. Python flake8, Dart analysis, cspell, prettier)
- `make format` -- runs all automatic code formatters (i.e. Python black, Dart fix, prettier), should fix most lint violations

## TODO

- Makefiles or something for managing scripts/tools
  - Install all environments command
- Husky pre-commit hooks
  - Hook to verify API generator is up-to-date
  - Hook to verify that python package versions are in sync similar to depcheck
- Finish mobile set up instructions
