@echo off
echo ========================================
echo Locate service-account-key.json File
echo ========================================
echo.

echo Searching for service-account-key.json on your system...
echo.

set "found=false"

echo 🔍 Checking common download locations...
echo.

REM Check Downloads folder
if exist "%USERPROFILE%\Downloads\service-account-key.json" (
    echo ✅ FOUND: %USERPROFILE%\Downloads\service-account-key.json
    set "found=true"
)

REM Check OneDrive Downloads
if exist "%USERPROFILE%\OneDrive\Downloads\service-account-key.json" (
    echo ✅ FOUND: %USERPROFILE%\OneDrive\Downloads\service-account-key.json
    set "found=true"
)

REM Check Desktop
if exist "%USERPROFILE%\Desktop\service-account-key.json" (
    echo ✅ FOUND: %USERPROFILE%\Desktop\service-account-key.json
    set "found=true"
)

REM Check OneDrive Desktop
if exist "%USERPROFILE%\OneDrive\Desktop\service-account-key.json" (
    echo ✅ FOUND: %USERPROFILE%\OneDrive\Desktop\service-account-key.json
    set "found=true"
)

REM Check current directory
if exist "%~dp0service-account-key.json" (
    echo ✅ FOUND: %~dp0service-account-key.json
    set "found=true"
)

echo.
echo 🔍 Searching entire system (this may take a moment)...
echo.

REM Search entire C: drive for the file
for /f "delims=" %%i in ('dir /s /b C:\*service-account-key.json 2^>nul') do (
    echo ✅ FOUND: %%i
    set "found=true"
)

echo.

if "%found%"=="false" (
    echo ❌ service-account-key.json not found on this system
    echo.
    echo 📋 The file needs to be downloaded from Google Cloud Console:
    echo.
    echo 1. Go to: https://console.cloud.google.com/iam-admin/serviceaccounts
    echo 2. Find: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
    echo 3. Click on the service account
    echo 4. Go to "Keys" tab
    echo 5. Click "Add Key" → "Create new key"
    echo 6. Select "JSON" format
    echo 7. Click "Create"
    echo 8. Save the downloaded file as "service-account-key.json"
    echo.
) else (
    echo ✅ Found service-account-key.json file(s) on your system!
    echo.
    echo 🚀 Next steps:
    echo 1. Run ADD_SERVICE_ACCOUNT_KEY.bat to copy to project directory
    echo 2. Or manually copy one of the found files to this directory
    echo 3. Ensure the filename is exactly "service-account-key.json"
)

echo.
echo 📂 Also checking for similar JSON files that might be the service account key...
echo.

REM Look for any JSON files that might be service account keys
for /f "delims=" %%i in ('dir /s /b "%USERPROFILE%\Downloads\*.json" 2^>nul') do (
    echo 📄 JSON file: %%i
)

for /f "delims=" %%i in ('dir /s /b "%USERPROFILE%\Desktop\*.json" 2^>nul') do (
    echo 📄 JSON file: %%i
)

echo.
echo 💡 Tips:
echo - The file might have been downloaded with a different name
echo - Check your browser's download history
echo - Look for files starting with your project name or "lap-reports"
echo - The file should contain "service_account" in its content
echo.

pause