# PowerShell script to push Lab Reports v2.1 to GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Pushing Lab Reports v2.1 to GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Checking Git status..." -ForegroundColor Yellow
git status
Write-Host ""

Write-Host "Adding all changes..." -ForegroundColor Yellow
git add .
Write-Host ""

Write-Host "Committing changes..." -ForegroundColor Yellow
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

Files Removed:
- Pharmacy_Compliance_GoogleDrive.html (OAuth version removed)

Architecture Improvements:
- Single backend-only application
- Clean visual status indicators
- Professional user interface
- Simplified deployment process"

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push origin main
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host " Push Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport" -ForegroundColor White
Write-Host "GitHub Pages: https://jared-t-proctor-jtp34.github.io/LabReport/" -ForegroundColor White
Write-Host "Custom Domain: https://labreporttool.xyz" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to continue"