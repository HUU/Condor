# Condor

Proof-of-concept Flutter + FastAPI monorepo showing how to structure a modularized
project and use OpenAPI specs to generate always up-to-date API clients.

## Prerequisites

- Java 11 (should come with macOS)
- Install homebrew, see <https://brew.sh/>
- Install ASDF (tool for downloading language runtimes and SDKs, sandboxing them to
  specific directories, all controlled with `.tool-versions`)
  - `brew install asdf`
  - Add `. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh` to `~/.profile` or `~/.zshrc`
- Install Python 3
  - `brew install python`
  - Add `export PATH="$(brew --prefix python)/libexec/bin:$PATH` to `~/.profile` or
    `~/.zshrc`
- Mobile development prerequisites
  - Rosetta: `sudo softwareupdate --install-rosetta --agree-to-license`
  - iOS
    - Xcode 15; after installing run the following:
      - `sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'`
      - `sudo xcodebuild -license
      - `xcodebuild -downloadPlatform iOS`
    - Cocoa Pods: `sudo gem install cocoapods`
  - Android
    - Android Studio 2023.1; after installing do the following:
      - Open Android Studio
      - Follow the Android Studio Setup Wizard
      - Install the following components:
        - Android SDK Platform, API 34.0.0
        - Android SDK Command-line Tools
        - Android SDK Build-Tools
        - Android SDK Platform-Tools
        - Android Emulator

## Setup steps after `git clone`

- Install required ASDF plugins:
  `cat .tool-versions | cut -d' ' -f1 | grep "^[^\#]" | xargs -i asdf plugin add  {}`
- Install required tools/SDKs: `asdf install`
- Download dependencies and setup virtual environments: `make install`
- Accept Android licenses: `cd apps/mobile && flutter doctor --android-licenses`
- Run `cd apps/mobile && flutter doctor`...if it points out any problems with your local
  set up, go fix them.

## API Changes

Whenever you change the API exposed by the backend, you must regenerate the API client.
If you forget to do this, git pre-commit hooks will stop you.

```sh
make dart_api_client
```

It's generally a good idea to make sure everything still compiles afterward

```sh
make lint
```

## Other Tools

This repo uses `make` to provide and manage all scripts and tools. Generally the idea is
that each project will use the language and framework-specific tools unadulterated (i.e.
`flutter` and `poetry`) for ease of development, and then anything custom is build rule
in a `Makefile`. The key tools to know about:

- `make install` -- download / update all dependencies across the repository
- `make lint` -- runs all linters across the project (i.e. Python flake8, Dart analysis,
  cspell, prettier)
- `make format` -- runs all automatic code formatters (i.e. Python black, Dart fix,
  prettier), should fix most lint violations
- `make depcheck` -- verify all projects use the same version of dependencies to avoid
  nasty diamond dependency issues.

## How does this repo work?

- `pnpm + node` are for developer tools since there are lots of handy linters and
  utilities in NPM.
- `python` (with [Poetry](https://python-poetry.org/) for package management) for
  backends
- `flutter` for mobile + web universal apps
- All of the above are installed / managed by [asdf](https://asdf-vm.com/) to avoid
  issues with different versions/different dev environments

Code is stored in either `apps/` or `lib/` as follows:

- `apps/` is for "end-user applications" like mobile apps or hosted applications like
  backends
- `lib/` is for shared coe and reusable libraries.

Code under each directory is segregated into sub-folders dubbed "projects." A project is
the smallest unit of build, test, and release. Both folders support python and
dart/flutter projects; there are examples of each. To keep things simple, there is no
fancy monorepo adaptations: each project is basically a standard python/dart project.
Both languages have reasonable support for linking local dependencies via path and don't
require any special handling.
