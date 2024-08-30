# ava_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## `fvm` - Flutter Version Manager

> FVM streamlines Flutter version management. It allows per-project SDK versions, ensuring consistent app builds and easier testing of new releases, thereby boosting the efficiency of your Flutter project tasks.

We use `fvm` to manage the Flutter version of our applications. For more information, please refer to the [official documentation](https://fvm.app/). For a quick-start, please continue reading.

### Homebrew

#### Install

```sh
brew tap leoafarias/fvm
brew install fvm
```

#### Uninstall

```sh
brew uninstall fvm
brew untap leoafarias/fvm
```

### Install.sh

```sh
curl -fsSL https://fvm.app/install.sh | bash
```

### Powershell

```sh
choco install fvm
```

## Usage

```sh
fvm use [version] [options]
```

For example, `fvm use 3.24.1` will install the Flutter version if it has not already been downloaded and then set the current project repository to use the specified version.

## Global Configuration

> If you are configuring a global version, FVM will check if the global version is set in your environment path. If it is not, it will provide you with the path that needs to be configured.

Link a global Flutter version

```sh
fvm global [version]
```

For example, `fvm global 3.24.1` will set the Flutter version `3.24.1` as the global version on your machine.
