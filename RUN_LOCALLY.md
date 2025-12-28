# Running the Project Locally

## Prerequisites

1. **Flutter SDK** - You need Flutter installed to run this project.

## Installation Steps

### Step 1: Install Flutter

**Option A: Using Homebrew (Recommended)**
```bash
brew install --cask flutter
```

**Option B: Manual Installation**
1. Visit https://flutter.dev/docs/get-started/install/macos
2. Download Flutter SDK for macOS
3. Extract it to a location (e.g., `~/development/flutter`)
4. Add Flutter to your PATH:
   ```bash
   export PATH="$PATH:~/development/flutter/bin"
   ```
   Add this line to your `~/.zshrc` to make it permanent.

### Step 2: Verify Flutter Installation
```bash
flutter doctor
```

This will check your setup and show any missing dependencies.

### Step 3: Get Project Dependencies
```bash
cd /Users/hammal/Documents/personal-dev/david-legend.github.io
flutter pub get
```

### Step 4: Run the Project

**For Web (Chrome):**
```bash
flutter run -d chrome
```

**For Web (Web Server):**
```bash
flutter run -d web-server
```

**For iOS Simulator:**
```bash
flutter run -d ios
```

**For Android Emulator:**
```bash
flutter run -d android
```

**List available devices:**
```bash
flutter devices
```

## Troubleshooting

### Disk Space Issue
If you encounter "No space left on device" errors:
1. Free up disk space on your Mac
2. Clean Homebrew cache: `brew cleanup`
3. Remove unused files and applications

### Missing Dependencies
Run `flutter doctor` to see what's missing and follow the suggestions.

### Build Issues
If you encounter build issues:
```bash
flutter clean
flutter pub get
flutter run
```

## Quick Start Script

After Flutter is installed, you can use:
```bash
./setup_and_run.sh
```

Or manually:
```bash
flutter pub get && flutter run -d chrome
```




