@echo off
echo ========================================
echo  Committing Backend Version v2.1
echo ========================================
echo.

echo Adding backend files to Git...
git add Labreports/Pharmacy_Compliance_Backend.html
git add Labreports/README.md
git add Labreports/index.html
git add Labreports/google_drive_backend.py
git add Labreports/test_backend.py
git add Labreports/TESTING_GUIDE.md
git add Labreports/FOLDER_README.md
echo.

echo Committing backend version...
git commit -m "Backend v2.1: Enhanced status symbols and streamlined architecture

- Enhanced status symbol system with visual indicators (✅⚠️❌🔄)
- Streamlined to single backend-only application
- Added tooltips for status symbols showing connection state
- Professional UI with clear Google Drive connection feedback
- Removed OAuth complexity - all authentication handled server-side
- Updated documentation to reflect backend-only workflow

Key Features:
- Single HTML application file
- Backend service integration
- Professional status display
- Automatic Google Drive uploads
- Fallback to local download
- Clean user interface"

echo.
echo Pushing to GitHub...
git push origin main
echo.

echo ========================================
echo  Backend Version Committed Successfully!
echo ========================================
echo.
echo Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
echo Live Site: https://labreporttool.xyz
echo.
pause