#!/bin/bash

echo "Building Flutter web app..."
flutter build web --release

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "Deploying to Vercel..."
    npx vercel --prod --cwd build/web
else
    echo "Build failed!"
    exit 1
fi

