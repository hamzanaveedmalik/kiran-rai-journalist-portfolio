#!/bin/bash

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "Flutter is not installed. Please install Flutter first:"
    echo "1. Visit https://flutter.dev/docs/get-started/install/macos"
    echo "2. Download and extract Flutter"
    echo "3. Add Flutter to your PATH"
    echo ""
    echo "Or install via Homebrew:"
    echo "  brew install --cask flutter"
    exit 1
fi

echo "Flutter found! Setting up project..."

# Get Flutter dependencies
echo "Fetching dependencies..."
flutter pub get

# Check for available devices
echo ""
echo "Available devices:"
flutter devices

echo ""
echo "To run the app, use one of these commands:"
echo "  flutter run -d chrome          # Run in Chrome browser"
echo "  flutter run -d web-server      # Run with web server"
echo "  flutter run                    # Run on connected device/emulator"
