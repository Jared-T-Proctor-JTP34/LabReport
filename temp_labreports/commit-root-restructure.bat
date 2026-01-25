@echo off
echo 🚀 Committing Repository Root Restructure...
echo.

echo 📊 Checking git status...
git status

echo.
echo 📁 Adding all changes...
git add .

echo.
echo 🗑️  Removing deleted files from git...
git add -u

echo.
echo 💾 Committing repository restructure...
git commit -m "refactor: Make Labreports folder the repository root

✅ Moved all Labreports contents to repository root
✅ Removed desktop shortcuts and personal files
✅ Clean, professional repository structure  
✅ Optimized for GitHub Pages deployment
✅ Repository now contains only pharmacy compliance application

Structure change:
- Before: Repository/Labreports/[app files]
- After: Repository/[app files]

Ready for production deployment at labreporttool.xyz
Version 2.2 - Professional repository structure"

echo.
echo 🌐 Pushing to GitHub...
git push origin main

echo.
echo ✅ Repository successfully restructured and committed!
echo.
echo 🎯 Repository Benefits:
echo    • Clean, professional structure
echo    • Only pharmacy compliance application files
echo    • Optimized for GitHub Pages
echo    • No desktop shortcuts or personal files
echo.
echo 🌍 Your application will be available at:
echo    • https://labreporttool.xyz
echo    • https://jared-t-proctor-jtp34.github.io/LabReport/
echo.

pause