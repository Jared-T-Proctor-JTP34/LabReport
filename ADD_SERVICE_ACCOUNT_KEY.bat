@echo off
echo ========================================
echo Add Service Account Key File
echo ========================================
echo.

echo This script will help you copy the service-account-key.json file
echo from your downloads to the project directory.
echo.

echo Looking for service-account-key.json in common locations...
echo.

set "found=false"
set "source_file="

REM Check Downloads folder
if exist "%USERPROFILE%\Downloads\service-account-key.json" (
    set "source_file=%USERPROFILE%\Downloads\service-account-key.json"
    set "found=true"
    echo ✅ Found in Downloads: %USERPROFILE%\Downloads\service-account-key.json
)

REM Check OneDrive Downloads
if exist "%USERPROFILE%\OneDrive\Downloads\service-account-key.json" (
    set "source_file=%USERPROFILE%\OneDrive\Downloads\service-account-key.json"
    set "found=true"
    echo ✅ Found in OneDrive Downloads: %USERPROFILE%\OneDrive\Downloads\service-account-key.json
)

REM Check Desktop
if exist "%USERPROFILE%\Desktop\service-account-key.json" (
    set "source_file=%USERPROFILE%\Desktop\service-account-key.json"
    set "found=true"
    echo ✅ Found on Desktop: %USERPROFILE%\Desktop\service-account-key.json
)

REM Check OneDrive Desktop
if exist "%USERPROFILE%\OneDrive\Desktop\service-account-key.json" (
    set "source_file=%USERPROFILE%\OneDrive\Desktop\service-account-key.json"
    set "found=true"
    echo ✅ Found on OneDrive Desktop: %USERPROFILE%\OneDrive\Desktop\service-account-key.json
)

echo.

if "%found%"=="true" (
    echo Copying service-account-key.json to project directory...
    copy "%source_file%" "%~dp0service-account-key.json"
    
    if exist "%~dp0service-account-key.json" (
        echo ✅ Service account key copied successfully!
        echo.
        echo 📋 File location: %~dp0service-account-key.json
        echo.
        
        echo Verifying JSON file structure...
        echo.
        echo First few lines of the file:
        echo ----------------------------------------
        head -n 10 "%~dp0service-account-key.json" 2>nul || (
            powershell -Command "Get-Content '%~dp0service-account-key.json' | Select-Object -First 10"
        )
        echo ----------------------------------------
        echo.
        
        echo ✅ Service account key is ready!
        echo.
        echo 🚀 NEXT STEPS:
        echo 1. Share Google Drive folder with service account email
        echo 2. Run: python BACKEND_SERVICE_ACCOUNT.py
        echo 3. Test: http://localhost:8001/status
        echo 4. Verify: Upload functionality works
        echo.
        
    ) else (
        echo ❌ Failed to copy service account key
        echo Please manually copy the file to: %~dp0
    )
) else (
    echo ❌ service-account-key.json not found in common locations
    echo.
    echo Please manually copy the file to this directory:
    echo %~dp0
    echo.
    echo Common download locations to check:
    echo - %USERPROFILE%\Downloads\
    echo - %USERPROFILE%\OneDrive\Downloads\
    echo - %USERPROFILE%\Desktop\
    echo - %USERPROFILE%\OneDrive\Desktop\
    echo.
    echo The file should be named exactly: service-account-key.json
    echo.
)

echo.
echo 📋 Service Account Information:
echo Email: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
echo Target: labreporting1177@gmail.com
echo Folder: 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
echo.

pause