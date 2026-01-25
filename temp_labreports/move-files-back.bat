@echo off
echo 🔄 Moving files back to Labreports folder...
echo.

REM Navigate to repository root
cd ..

echo 📁 Moving essential application files to Labreports folder...

REM Move application files back to Labreports
move "Pharmacy_Compliance_Backend.html" "Labreports\" 2>nul
move "index.html" "Labreports\" 2>nul
move "google_drive_backend.py" "Labreports\" 2>nul
move "README.md" "Labreports\" 2>nul
move "GITHUB_GOOGLE_API_SETUP.md" "Labreports\" 2>nul
move "TESTING_GUIDE.md" "Labreports\" 2>nul
move "test_backend.py" "Labreports\" 2>nul
move "local-https-server.py" "Labreports\" 2>nul
move "cert.pem" "Labreports\" 2>nul
move "key.pem" "Labreports\" 2>nul
move ".gitignore" "Labreports\" 2>nul
move "CNAME" "Labreports\" 2>nul
move "REPOSITORY_CLEANUP_SUMMARY.md" "Labreports\" 2>nul
move "commit-changes.ps1" "Labreports\" 2>nul
move "commit-all-changes.bat" "Labreports\" 2>nul

REM Move .github folder back to Labreports
if exist ".github" (
    move ".github" "Labreports\" 2>nul
)

echo.
echo ✅ Files moved back to Labreports folder!
echo 📂 Labreports folder now contains all project files
echo.

REM Return to Labreports directory
cd Labreports

echo 🧪 Testing file structure...
dir

echo.
echo ✅ Project restored to Labreports folder!
pause