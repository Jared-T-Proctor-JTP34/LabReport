@echo off
echo ========================================
echo Update Frontend for Cloud Backend
echo ========================================
echo.

echo This script will update your frontend application to use
echo the Google Cloud Run backend instead of localhost.
echo.

set /p cloud_url="Enter your Cloud Run service URL (e.g., https://pharmacy-compliance-backend-xxx-uc.a.run.app): "

if "%cloud_url%"=="" (
    echo ❌ No URL provided. Exiting.
    pause
    exit /b 1
)

echo.
echo Updating frontend configuration...
echo.
echo 📝 Backend URL: %cloud_url%
echo 📁 File: Pharmacy_Compliance_Backend.html
echo.

REM Create backup
copy "Pharmacy_Compliance_Backend.html" "Pharmacy_Compliance_Backend.html.backup"

echo ✅ Backup created: Pharmacy_Compliance_Backend.html.backup
echo.

REM Update the backend URL in the frontend
powershell -Command "(Get-Content 'Pharmacy_Compliance_Backend.html') -replace 'BACKEND_URL: isDevelopment \? ''http://localhost:8001'' : ''https://api\.labreporttool\.xyz''', 'BACKEND_URL: isDevelopment ? ''http://localhost:8001'' : ''%cloud_url%''' | Set-Content 'Pharmacy_Compliance_Backend.html'"

echo ✅ Frontend updated with Cloud Run URL
echo.

echo 🚀 Next steps:
echo 1. Test the updated frontend locally
echo 2. Run: SYNC_GITHUB.bat to deploy to GitHub Pages
echo 3. Test complete integration at https://labreporttool.xyz
echo 4. Verify automatic Google Drive uploads work
echo.

echo 📋 Your backend is now running 24/7 on Google Cloud!
echo No need to start local backend service anymore.
echo.

pause