@echo off
echo ========================================
echo  Syncing Lab Reports v2.1 to GitHub
echo ========================================
echo.

echo Checking Git status...
git status
echo.

echo Adding all changes...
git add .
echo.

echo Committing changes...
git commit -m "v2.1: Simplified to backend-only version with enhanced status symbols

Major Updates:
- Removed Google Drive OAuth version (Pharmacy_Compliance_GoogleDrive.html)
- Enhanced status symbol system with visual indicators (✅⚠️❌🔄)
- Updated all documentation to reflect backend-only architecture
- Streamlined project structure for better user experience
- Added helpful tooltips for status symbols
- Updated version to 2.1 with professional status display

Files Modified:
- Pharmacy_Compliance_Backend.html (enhanced status symbols)
- README.md (updated to v2.1, backend-only docs)
- TESTING_GUIDE.md (backend-only testing instructions)
- FOLDER_README.md (simplified structure docs)
- local-https-server.py (updated references)
- index.html (confirmed backend redirect)

Files Removed:
- Pharmacy_Compliance_GoogleDrive.html (OAuth version removed)

Architecture Improvements:
- Single backend-only application
- Clean visual status indicators
- Professional user interface
- Simplified deployment process"

echo.
echo Pushing to GitHub...
git push origin main
echo.

echo ========================================
echo  Sync Complete!
echo ========================================
echo.
echo Your repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
echo GitHub Pages: https://jared-t-proctor-jtp34.github.io/LabReport/
echo Custom Domain: https://labreporttool.xyz
echo.
pause