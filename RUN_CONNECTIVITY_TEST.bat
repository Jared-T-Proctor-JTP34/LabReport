@echo off
echo ========================================
echo Google Drive Connectivity Test
echo ========================================
echo.

echo This will test the Google Drive service account integration
echo for automatic uploads to labreporting1177@gmail.com
echo.

echo 📋 Configuration:
echo Service Account: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
echo Target Email: labreporting1177@gmail.com
echo Target Folder: 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
echo.

REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found. Please install Python 3.7+ and try again.
    pause
    exit /b 1
)

REM Check if service account file exists
if not exist "service-account-key.json" (
    echo ❌ Service account key file not found: service-account-key.json
    echo.
    echo Please run ADD_SERVICE_ACCOUNT_KEY.bat first to add the JSON key file.
    echo.
    pause
    exit /b 1
)

echo ✅ Python found
echo ✅ Service account key file found
echo.

echo Installing required Python packages...
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

echo.
echo Running connectivity test...
echo.

python test_google_drive_connectivity.py

echo.
echo ========================================
echo Test Complete
echo ========================================
echo.

if %errorlevel% equ 0 (
    echo ✅ All tests passed! Google Drive integration is ready.
    echo.
    echo 🚀 Next steps:
    echo 1. Run: python BACKEND_SERVICE_ACCOUNT.py
    echo 2. Test: http://localhost:8001/status
    echo 3. Deploy: SYNC_GITHUB.bat
    echo 4. Test complete application functionality
) else (
    echo ❌ Some tests failed. Please check the output above.
    echo.
    echo 🔧 Common solutions:
    echo 1. Ensure service-account-key.json is correct
    echo 2. Share Google Drive folder with service account
    echo 3. Grant Editor permissions to service account
    echo 4. Verify folder ID is correct
)

echo.
pause