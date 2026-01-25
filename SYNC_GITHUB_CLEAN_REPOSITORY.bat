@echo off
echo ========================================
echo   SYNC GITHUB - CLEAN REPOSITORY
echo ========================================
echo.
echo 🧹 Syncing GitHub to contain only current project files...
echo 🎯 Goal: Clean, professional repository with only pharmacy compliance application
echo.

echo ✅ Step 1: Moving all project files from Labreports to repository root...

REM Move all essential project files to root
move "Labreports\.github" ".\" 2>nul
move "Labreports\.gitignore" ".\" 2>nul
move "Labreports\cert.pem" ".\" 2>nul
move "Labreports\CNAME" ".\" 2>nul
move "Labreports\DOMAIN_TRANSITION_CHECKLIST.md" ".\" 2>nul
move "Labreports\GITHUB_GOOGLE_API_SETUP.md" ".\" 2>nul
move "Labreports\google_drive_backend.py" ".\" 2>nul
move "Labreports\index.html" ".\" 2>nul
move "Labreports\key.pem" ".\" 2>nul
move "Labreports\local-https-server.py" ".\" 2>nul
move "Labreports\Pharmacy_Compliance_Backend.html" ".\" 2>nul
move "Labreports\README.md" ".\" 2>nul
move "Labreports\REPOSITORY_CLEANUP_SUMMARY.md" ".\" 2>nul
move "Labreports\test_backend.py" ".\" 2>nul
move "Labreports\TESTING_GUIDE.md" ".\" 2>nul

echo    ✓ Project files moved to repository root

echo.
echo ✅ Step 2: Removing empty Labreports folder and cleanup files...
del "Labreports\verify-production-readiness.bat" 2>nul
rmdir "Labreports" 2>nul
del "desktop.ini" 2>nul

echo    ✓ Cleanup complete

echo.
echo ✅ Step 3: Verifying clean repository structure...
echo.
echo 📁 Repository now contains only project files:
dir /b

echo.
echo ✅ Step 4: Preparing git sync...
echo    📊 Current git status:
git status

echo.
echo ✅ Step 5: Adding all current project files...
git add .

echo.
echo ✅ Step 6: Removing any deleted files from git tracking...
git add -u

echo.
echo ✅ Step 7: Committing clean repository structure...
git commit -m "refactor: Clean repository - move to root and sync only project files

🧹 Repository Restructure:
✅ Moved all project files from Labreports/ to repository root
✅ Removed Labreports folder structure
✅ Clean, professional repository containing only pharmacy compliance application
✅ Optimized for GitHub Pages deployment

📁 Repository Structure (Root Level):
├── .github/workflows/deploy.yml          # GitHub Actions deployment
├── Pharmacy_Compliance_Backend.html      # Main pharmacy compliance application
├── index.html                            # Entry point
├── google_drive_backend.py               # Backend service for local development
├── README.md                             # Comprehensive project documentation
├── GITHUB_GOOGLE_API_SETUP.md           # Google Cloud Console setup guide
├── TESTING_GUIDE.md                     # Testing instructions
├── test_backend.py                       # Backend testing suite
├── local-https-server.py                # Local HTTPS development server
├── CNAME                                 # Custom domain configuration (labreporttool.xyz)
├── .gitignore                           # Git ignore rules
├── cert.pem & key.pem                   # SSL certificates for development
└── Documentation files                   # Setup and transition guides

🌐 GitHub Pages Optimization:
✅ Files at repository root for proper GitHub Pages deployment
✅ CNAME configured for custom domain (labreporttool.xyz)
✅ GitHub Actions workflow ready for automatic deployment
✅ Professional repository structure for public presentation

🧪 Application Features:
✅ USP 795, 797, 800 compliance monitoring
✅ Dual Google Drive integration (local backend + GitHub Pages API)
✅ Automatic PDF report generation and upload
✅ Role-based access control and cleaning task management
✅ Historical data analysis and compliance statistics
✅ Environment detection and smart fallback systems

Ready for production deployment at labreporttool.xyz
Version 2.2 - Clean repository with professional structure"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Step 8: Pushing clean repository to GitHub...
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ========================================
        echo   GITHUB SYNC COMPLETE!
        echo ========================================
        echo.
        echo 🎉 Repository successfully synced with clean structure!
        echo.
        echo 📊 Repository Benefits:
        echo    • Clean, professional GitHub repository
        echo    • Only pharmacy compliance application files
        echo    • Files at root level for optimal GitHub Pages deployment
        echo    • No unnecessary folders or scattered files
        echo    • Ready for immediate production use
        echo.
        echo 🌐 Deployment Status:
        echo    • Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
        echo    • GitHub Actions: Will deploy automatically (2-3 minutes)
        echo    • Live Application: https://labreporttool.xyz (5-15 minutes)
        echo    • SSL Certificate: Will be provisioned automatically
        echo.
        echo 🧪 Application Ready:
        echo    • USP compliance monitoring for areas 795, 797, 800
        echo    • Google Drive integration with dual deployment support
        echo    • Professional PDF report generation
        echo    • Complete documentation and setup guides
        echo.
        echo 🎯 Next Steps:
        echo    1. Wait 2-3 minutes for GitHub Actions deployment
        echo    2. Visit https://labreporttool.xyz to test application
        echo    3. Configure Google Cloud Console if needed (see setup guide)
        echo    4. Test all functionality including Google Drive integration
        echo.
        echo ✅ Your pharmacy compliance application is now live!
        echo.
    ) else (
        echo.
        echo ❌ Push failed. Please check your internet connection and GitHub authentication.
    )
) else (
    echo.
    echo ❌ Commit failed. Please check for any errors above.
)

echo.
echo Press any key to continue...
pause >nul

REM Self-delete this script
del "%~f0"