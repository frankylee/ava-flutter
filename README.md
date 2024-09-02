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

## Setup

### Localization

Be sure to run `flutter gen-l10n` to generate the localization files.

---

## Architecture

This project uses a combination of Feature-Sliced Design and MVVM. Feature-Sliced Design can be illustrated by the graphic below:

<img src="https://feature-sliced.design/assets/ideal-img/visual_schema.b6c18f6.1030.jpg" />

To learn more about FSD, please view [Feature-Sliced Design website](https://feature-sliced.design/).

### Folder structure

```
|-- android/
|-- fonts/
|-- ios/
|-- lib/
|   |-- app/                    # FSD layer where all app-level configs live.
|   |   |-- l10n/
|   |   |-- router/
|   |   |-- theme/
|   |   |-- ava.dart
|   |-- entities/               # FSD layer where all business models live.
|   |   |-- credit_card/
|   |   |   |-- model/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |   |-- credit_factors/
|   |   |   |-- model/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |   |-- credit_score/
|   |   |   |-- model/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |   |-- employment/
|   |   |   |-- model/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |   |-- secure_account/
|   |   |   |-- model/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |-- features/               # FSD layer where all features live.
|   |   |-- give_feedback/
|   |   |   |-- view/
|   |   |   |-- view_model/
|   |-- pages/                  # FSD layer where all route-level pages live.
|   |   |-- home/
|   |   |   |-- home_page.dart
|   |   |-- settings/
|   |   |   |-- view/
|   |   |   |-- settings_page.dart
|   |-- shared/
|   |   |-- extension/         # Extensions.
|   |   |-- local_storage/     # Shared Preferences and local storage logic.
|   |   |-- mixin/             # Mixins.
|   |   |-- ui/                # Generic shared widgets.
|-- scripts/
|-- test/
```

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
