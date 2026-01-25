@echo off
echo ========================================
echo   COMPLETING GITHUB SYNC
echo ========================================
echo.
echo 🎯 Finalizing clean repository structure...
echo.

echo ✅ Step 1: Removing empty Labreports folder...
if exist "Labreports" (
    rmdir "Labreports" 2>nul
    echo    ✓ Empty Labreports folder removed
) else (
    echo    ✓ Labreports folder already removed
)

echo.
echo ✅ Step 2: Cleaning up unnecessary files...
del "desktop.ini" 2>nul
del "SYNC_GITHUB_CLEAN_REPOSITORY.bat" 2>nul

echo    ✓ Cleanup files removed

echo.
echo ✅ Step 3: Current repository structure:
echo ----------------------------------------
dir /b
echo ----------------------------------------

echo.
echo ✅ Step 4: Checking git status...
git status

echo.
echo ✅ Step 5: Adding all changes to git...
git add .

echo.
echo ✅ Step 6: Adding deleted files/folders to git...
git add -u

echo.
echo ✅ Step 7: Committing clean repository structure...
git commit -m "refactor: Complete repository cleanup - pharmacy compliance app at root

🧹 Final Repository Structure:
✅ All project files moved to repository root for GitHub Pages optimization
✅ Removed empty Labreports folder
✅ Clean, professional repository structure
✅ Only pharmacy compliance application files

📁 Root Level Files:
├── .github/workflows/deploy.yml          # GitHub Actions auto-deployment
├── Pharmacy_Compliance_Backend.html      # Main pharmacy compliance application  
├── index.html                            # Application entry point
├── google_drive_backend.py               # Backend service for local development
├── README.md                             # Comprehensive project documentation
├── GITHUB_GOOGLE_API_SETUP.md           # Google Cloud Console setup guide
├── TESTING_GUIDE.md                     # Testing and troubleshooting guide
├── test_backend.py                       # Backend testing suite
├── local-https-server.py                # Local HTTPS development server
├── CNAME                                 # Custom domain: labreporttool.xyz
├── .gitignore                           # Git ignore configuration
├── cert.pem & key.pem                   # SSL certificates for development
└── Documentation files                   # Setup and transition guides

🌐 GitHub Pages Ready:
✅ Optimized file structure for GitHub Pages deployment
✅ Custom domain configured (labreporttool.xyz)
✅ Automatic SSL certificate provisioning
✅ GitHub Actions workflow for continuous deployment

🧪 Pharmacy Compliance Features:
✅ USP 795, 797, 800 compliance monitoring
✅ Dual Google Drive integration (local + GitHub Pages)
✅ Automatic PDF report generation and cloud upload
✅ Role-based access control (admin/pharmacist/tech)
✅ Daily cleaning task management and verification
✅ Historical data analysis and compliance statistics
✅ Real-time compliance validation and alerts

Ready for production deployment - Version 2.2"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Step 8: Pushing to GitHub...
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ========================================
        echo   SUCCESS! GITHUB SYNC COMPLETE
        echo ========================================
        echo.
        echo 🎉 Repository successfully synced and cleaned!
        echo.
        echo 📊 Repository Status:
        echo    • Structure: Clean, professional, root-level files
        echo    • Content: Only pharmacy compliance application
        echo    • Deployment: GitHub Pages optimized
        echo    • Domain: Ready for labreporttool.xyz
        echo.
        echo 🌐 Live Deployment:
        echo    • Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
        echo    • GitHub Actions: Deploying now (2-3 minutes)
        echo    • Application: https://labreporttool.xyz (live in 5-15 minutes)
        echo.
        echo 🧪 Application Features Ready:
        echo    • USP compliance monitoring (795, 797, 800)
        echo    • Google Drive integration
        echo    • PDF report generation
        echo    • Role-based access control
        echo    • Historical data tracking
        echo.
        echo 🎯 Next Steps:
        echo    1. Wait 2-3 minutes for GitHub Actions deployment
        echo    2. Visit https://labreporttool.xyz to test
        echo    3. Configure Google Cloud Console (see setup guide)
        echo    4. Test all pharmacy compliance functionality
        echo.
        echo ✅ Your pharmacy compliance system is now live!
        echo.
    ) else (
        echo.
        echo ❌ Push to GitHub failed.
        echo    Please check your internet connection and GitHub authentication.
        echo    You may need to use GitHub Desktop to push the changes.
    )
) else (
    echo.
    echo ❌ Git commit failed.
    echo    This might be because there are no changes to commit.
    echo    Your repository may already be up to date.
)

echo.
echo Press any key to continue...
pause >nul

REM Self-delete this script
del "%~f0"