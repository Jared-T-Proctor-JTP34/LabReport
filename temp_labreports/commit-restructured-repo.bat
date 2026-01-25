@echo off
echo 🚀 Committing Restructured Repository...
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
echo 💾 Committing restructured repository...
git commit -m "refactor: Restructure repository - move Labreports to root and remove desktop files

✅ Moved all Labreports contents to repository root
✅ Removed desktop shortcuts and unnecessary files  
✅ Clean, professional repository structure
✅ GitHub Pages integration ready
✅ Ready for production deployment

Repository now contains only essential pharmacy compliance application files.
Version 2.2 - Professional deployment ready"

echo.
echo 🌐 Pushing to GitHub...
git push origin main

echo.
echo ✅ Repository successfully restructured and committed!
echo 🌍 Your application will be available at:
echo    • https://labreporttool.xyz
echo    • https://jared-t-proctor-jtp34.github.io/LabReport/
echo.
echo 📋 Repository is now clean and professional!

pause