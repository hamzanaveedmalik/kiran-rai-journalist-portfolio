# Deploying Flutter Web App to Vercel

This guide will help you deploy your Kiran Rai Portfolio to Vercel.

## Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel CLI** (Optional): Install with `npm install -g vercel`
3. **Flutter SDK**: Ensure Flutter is installed and in your PATH

## Method 1: Deploy via Vercel Dashboard (Easiest)

1. **Build the app**:
   ```bash
   flutter build web --release
   ```

2. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Add Vercel deployment configuration"
   git push origin main
   ```

3. **Import to Vercel**:
   - Go to [vercel.com/new](https://vercel.com/new)
   - Import your GitHub repository
   - Vercel will auto-detect the `vercel.json` configuration
   - Click "Deploy"

## Method 2: Deploy via Vercel CLI

1. **Install Vercel CLI** (if not already installed):
   ```bash
   npm install -g vercel
   ```

2. **Build the app**:
   ```bash
   flutter build web --release
   ```

3. **Login to Vercel**:
   ```bash
   vercel login
   ```

4. **Deploy**:
   ```bash
   vercel --prod
   ```

## Configuration

The `vercel.json` file has been created with the following settings:
- **Build Command**: `flutter build web --release`
- **Output Directory**: `build/web`
- **Routes**: Configured for SPA routing (all routes redirect to index.html)

## Important Notes

1. **YouTube Thumbnails**: The CORS issue you experienced locally will be resolved in production. YouTube thumbnails will load properly on Vercel.

2. **Custom Domain**: You can add a custom domain in Vercel's dashboard under Project Settings → Domains.

3. **Environment Variables**: If you need any environment variables, add them in Vercel's dashboard under Project Settings → Environment Variables.

4. **Automatic Deployments**: Once connected to GitHub, Vercel will automatically deploy on every push to your main branch.

## Troubleshooting

- **Build fails**: Ensure Flutter SDK is properly installed and accessible in your PATH
- **404 on routes**: The `vercel.json` routes configuration handles SPA routing
- **Images not loading**: Check that all assets are properly declared in `pubspec.yaml`

## Updating Your Site

Simply push changes to your GitHub repository:
```bash
git add .
git commit -m "Your update message"
git push origin main
```

Vercel will automatically rebuild and redeploy your site.

