# Hot Reload Guide for Flutter Web

## Quick Start

Hot reload is **already enabled** when you run:
```bash
flutter run -d chrome
```

## How to Use Hot Reload

While the Flutter app is running in the terminal, you can:

### Hot Reload (Fast - Updates code without losing state)
- Press **`r`** in the terminal where Flutter is running
- This updates your code changes instantly without restarting the app
- **Best for**: UI changes, text updates, styling changes

### Hot Restart (Faster than full restart - Resets app state)
- Press **`R`** (capital R) in the terminal
- This restarts the app but keeps it running
- **Best for**: When hot reload doesn't work or you need to reset state

### Full Restart
- Press **`q`** to quit, then run `flutter run -d chrome` again
- **Best for**: When you change dependencies or major configuration

## Tips for Better Hot Reload Performance

### 1. Use HTML Renderer (Faster for Development)
```bash
flutter run -d chrome --web-renderer html
```
- Faster compilation
- Better hot reload performance
- Good for development

### 2. Use CanvasKit Renderer (Better Graphics)
```bash
flutter run -d chrome --web-renderer canvaskit
```
- Better graphics rendering
- Slightly slower compilation
- Good for production-like testing

### 3. Enable Hot Reload in VS Code/IDE
If using VS Code with Flutter extension:
- Save file (Cmd+S / Ctrl+S) automatically triggers hot reload
- Or use the hot reload button in the debug toolbar

## What Works with Hot Reload

✅ **Works well:**
- Changing text/strings
- Modifying widget properties
- Styling changes
- Color changes
- Layout adjustments

⚠️ **May need Hot Restart:**
- Adding new imports
- Changing class structure
- Modifying constructors
- State management changes

❌ **Requires Full Restart:**
- Adding new dependencies
- Changing `pubspec.yaml`
- Modifying `main()` function structure
- Platform-specific code changes

## Troubleshooting

### Hot Reload Not Working?
1. Try hot restart (press `R`)
2. Check for compilation errors in terminal
3. Make sure you're in the terminal where Flutter is running
4. Try full restart if needed

### Changes Not Appearing?
1. Make sure you saved the file
2. Check browser console for errors (F12)
3. Try hard refresh in browser (Cmd+Shift+R / Ctrl+Shift+R)
4. Use hot restart (press `R`)

## Recommended Development Workflow

1. Start the app:
   ```bash
   flutter run -d chrome --web-renderer html
   ```

2. Make changes to your code

3. Save the file (auto hot reload if using IDE) or press `r` in terminal

4. See changes instantly in the browser!

5. If something doesn't update, press `R` for hot restart




