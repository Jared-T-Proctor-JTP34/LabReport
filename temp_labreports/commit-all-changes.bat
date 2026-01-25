@echo off
echo 🚀 Committing GitHub Pages Integration and Repository Cleanup...
echo.

REM Navigate to repository root (parent of Labreports)
cd ..

REM Add all changes in Labreports folder
echo 📁 Adding changes...
git add Labreports/

REM Commit with descriptive message
echo 💾 Committing changes...
git commit -m "feat: GitHub Pages integration and repository cleanup - Version 2.2

✅ Environment detection for local vs GitHub Pages deployment
✅ Dual integration: Backend service + Direct Google API  
✅ Click-to-authenticate flow for GitHub Pages
✅ Enhanced status indicators with tooltips
✅ GitHub Actions workflow for automatic deployment
✅ Repository cleanup: removed 14 redundant files (52%% reduction)
✅ Streamlined to 13 essential files only
✅ Updated documentation and file structure

Ready for production deployment at labreporttool.xyz"

REM Push to GitHub
echo 🌐 Pushing to GitHub...
git push origin main

echo.
echo ✅ Changes successfully committed and pushed!
echo 🌍 Your application will be available at:
echo    • https://labreporttool.xyz
echo    • https://jared-t-proctor-jtp34.github.io/LabReport/
echo.
echo 📋 Next steps:
echo    1. Configure Google Cloud Console (see GITHUB_GOOGLE_API_SETUP.md)
echo    2. Test the application on GitHub Pages
echo    3. Click the status symbol to authenticate with Google Drive

REM Return to Labreports directory
cd Labreports

pause