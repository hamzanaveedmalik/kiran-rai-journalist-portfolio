#!/bin/bash

echo "🚀 Deploying Kiran Rai Portfolio to Vercel..."
echo ""

# Navigate to project root
cd "$(dirname "$0")"

# Build Flutter web app
echo "📦 Building Flutter web app..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Deploy to Vercel
echo "🌐 Deploying to Vercel..."
cd build/web
npx vercel --prod

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo "🎉 Your portfolio is now live!"
else
    echo "❌ Deployment failed!"
    exit 1
fi

