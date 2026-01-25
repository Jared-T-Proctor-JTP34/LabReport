@echo off
echo.
echo ========================================
echo   COMMITTING TO GITHUB
echo ========================================
echo.
echo 🚀 Preparing to commit comprehensive README and project files...
echo.

REM Check if we're in the right directory
if exist "Labreports" (
    echo ✅ Found Labreports folder - proceeding with commit...
) else (
    echo ❌ Labreports folder not found. Please run this from the repository root.
    pause
    exit /b 1
)

echo.
echo 📊 Checking git status...
git status

echo.
echo 📁 Adding all files to git...
git add .

echo.
echo 💾 Committing comprehensive documentation and project files...
git commit -m "docs: Add comprehensive README and complete project documentation

✅ Professional README.md with complete project overview
✅ System architecture and dual integration documentation  
✅ USP compliance standards (795, 797, 800) detailed
✅ Quick start guides for GitHub Pages and local development
✅ Complete feature documentation and functionality overview
✅ Deployment options and configuration instructions
✅ Testing procedures and troubleshooting guides
✅ Security features and performance documentation
✅ Development setup and contribution guidelines
✅ Professional GitHub repository presentation

Features documented:
- Live application: https://labreporttool.xyz
- Dual integration: Backend service + Direct Google API
- Environment detection and smart fallbacks
- Real-time USP compliance monitoring
- Automatic PDF report generation with Google Drive upload
- Role-based access control and cleaning task management
- Historical data analysis and compliance statistics

Ready for professional pharmacy compliance deployment
Version 2.2 - Complete documentation and GitHub Pages integration"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Commit successful! Now pushing to GitHub...
    echo.
    echo 🌐 Pushing to GitHub repository...
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ========================================
        echo   SUCCESS! 
        echo ========================================
        echo.
        echo ✅ All changes successfully committed and pushed to GitHub!
        echo.
        echo 🌍 Your repository is now live with comprehensive documentation:
        echo    • Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
        echo    • Live App: https://labreporttool.xyz
        echo    • GitHub Pages: https://jared-t-proctor-jtp34.github.io/LabReport/
        echo.
        echo 📚 Documentation includes:
        echo    • Complete setup instructions
        echo    • USP compliance standards
        echo    • Dual integration architecture
        echo    • Testing and troubleshooting guides
        echo    • Professional GitHub presentation
        echo.
        echo 🎯 Next steps:
        echo    1. Visit your GitHub repository to see the documentation
        echo    2. Test the live application at labreporttool.xyz
        echo    3. Configure Google Cloud Console if needed
        echo.
    ) else (
        echo.
        echo ❌ Push failed. Please check your internet connection and try again.
        echo    You may need to authenticate with GitHub.
    )
) else (
    echo.
    echo ❌ Commit failed. Please check for any errors above.
)

echo.
echo Press any key to close...
pause >nul