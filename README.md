# Donut App

Donuts Shop mobile application built with Flutter.

## Requirements

Use the following SDK versions (or newer compatible versions):

  Tool      Version
  --------- ----------------------------------------------
  Flutter   `>= 3.44.0`
  Dart      `^3.12.0` (Dart 3.12 or newer, before 4.0.0)

The project declares these constraints in `pubspec.yaml`:

``` yaml
environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"
```

You can check your installed versions with:

``` bash
flutter --version
dart --version
flutter doctor -v
```

If your Flutter installation does not satisfy the SDK constraints,
upgrade Flutter before installing dependencies.

## Getting started

### 1. Clone the repository

``` bash
git clone <repository-url>
cd donut_app
```

Replace `<repository-url>` with the GitHub repository URL.

### 2. Install dependencies

``` bash
flutter pub get
```

### 3. Generate the required Dart files

This project uses code generation for Riverpod, Freezed, and Drift.

Run:

``` bash
dart run build_runner build --delete-conflicting-outputs
```

Run this command again whenever you change code that uses generated
Riverpod providers, Freezed models, or Drift table/database definitions.

For continuous generation while developing:

``` bash
dart run build_runner watch --delete-conflicting-outputs
```

### 4. Run the app

Make sure an emulator/simulator is running or a physical device is
connected, then run:

``` bash
flutter devices
flutter run
```

To run on a specific device:

``` bash
flutter run -d <device-id>
```

## Build commands

### Android

``` bash
flutter build apk --release
```

To build an Android App Bundle for Play Store distribution:

``` bash
flutter build appbundle --release
```

### iOS

iOS builds require macOS and Xcode.

``` bash
flutter build ios --release
```

Open `ios/Runner.xcworkspace` in Xcode when you need to configure
signing, capabilities, or other iOS-specific settings.

## Main packages

The project uses these main packages:

-   **Flutter** -- application UI and framework.
-   **Riverpod** -- state management and dependency injection.
-   **GoRouter** -- declarative navigation and routing.
-   **Drift** -- local SQLite database.
-   **Flutter Secure Storage** -- secure storage for session data.
-   **Freezed** -- immutable models and unions.
-   **Flutter Hooks** -- lifecycle-aware widget hooks.
-   **Logger** -- application logging.
-   **Connectivity Plus** -- network connectivity status.
-   **Flutter SVG** -- SVG asset rendering.

See `pubspec.yaml` for the complete dependency list and pinned version
constraints.

## Assets and fonts

The app declares these asset directories:

``` text
assets/
├── fonts/
│   ├── barlow/
│   └── dm_sans/
├── icons/
└── images/
```

The project uses the **Barlow** and **DM Sans** font families. Keep the
font files and asset paths in sync with the declarations in
`pubspec.yaml`.

## Project version

Current application version:

``` text
1.0.0+1
```

-   `1.0.0` is the application version.
-   `1` is the build number.

## Useful development commands

``` bash
# Install dependencies
flutter pub get

# Regenerate generated code
dart run build_runner build --delete-conflicting-outputs

# Analyze the project
flutter analyze

# Run tests
flutter test

# Check outdated dependencies
flutter pub outdated
```

## Notes

-   Do not edit generated files manually (for example, files ending in
    `.g.dart` or `.freezed.dart`). Update the source files and run the
    code generator instead.
-   Keep the Flutter and Dart SDK versions within the constraints
    declared in `pubspec.yaml`.
-   If you encounter an environment or build issue, run
    `flutter doctor -v` and review the reported Android/iOS toolchain
    requirements.
