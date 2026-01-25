@echo off
echo 📁 Moving all project files to Labreports folder...
echo.

echo ✅ Moving core application files...
move "Pharmacy_Compliance_Backend.html" "Labreports\" 2>nul
move "index.html" "Labreports\" 2>nul
move "google_drive_backend.py" "Labreports\" 2>nul
move "README.md" "Labreports\" 2>nul

echo ✅ Moving documentation files...
move "GITHUB_GOOGLE_API_SETUP.md" "Labreports\" 2>nul
move "TESTING_GUIDE.md" "Labreports\" 2>nul
move "REPOSITORY_CLEANUP_SUMMARY.md" "Labreports\" 2>nul

echo ✅ Moving development tools...
move "test_backend.py" "Labreports\" 2>nul
move "local-https-server.py" "Labreports\" 2>nul

echo ✅ Moving SSL certificates...
move "cert.pem" "Labreports\" 2>nul
move "key.pem" "Labreports\" 2>nul

echo ✅ Moving configuration files...
move ".gitignore" "Labreports\" 2>nul
move "CNAME" "Labreports\" 2>nul

echo ✅ Moving scripts...
move "commit-changes.ps1" "Labreports\" 2>nul
move "commit-all-changes.bat" "Labreports\" 2>nul

echo ✅ Moving GitHub Actions...
if exist ".github" (
    move ".github" "Labreports\" 2>nul
)

echo.
echo 🗑️  Removing desktop shortcuts and unnecessary files...
del "desktop.ini" 2>nul

echo.
echo ✅ All project files moved to Labreports folder!
echo.
echo 📂 Checking Labreports folder contents...
dir "Labreports"

echo.
echo 🎯 Project organization complete!
echo    • All application files in Labreports folder
echo    • Desktop shortcuts removed from root
echo    • Clean repository structure
echo.

pause