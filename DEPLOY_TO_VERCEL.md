# Kiran Rai Portfolio - Deployment Guide

## Quick Deploy (Recommended)

Since Vercel can't build Flutter apps directly, you need to build locally and deploy the output.

### One-Time Setup

The deployment is already configured. You just need to build and deploy.

### Deploy Process

```bash
# 1. Navigate to project directory
cd /Users/hammal/Documents/personal-dev/david-legend.github.io

# 2. Build the Flutter web app
flutter build web --release --web-renderer html

# 3. Deploy to Vercel
cd build/web
npx vercel --prod

# Follow the prompts:
# - Link to existing project: Yes
# - Project: kiran-rai-journalist-portfolio (or your project name)
```

### Update and Redeploy

Whenever you make changes:

```bash
# 1. Make your changes to the code

# 2. Build
flutter build web --release --web-renderer html

# 3. Deploy
cd build/web && npx vercel --prod
```

## Using the Deploy Script

Or use the included script:

```bash
./deploy-to-vercel.sh
```

## Notes

- The `--web-renderer html` flag ensures better compatibility and solves CORS issues
- YouTube thumbnails will work properly once deployed
- Each deployment takes ~2-3 minutes

