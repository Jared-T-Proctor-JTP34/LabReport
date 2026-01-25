@echo off
echo ========================================
echo QUICK BACKEND TEST - Service Account Ready
echo ========================================
echo.

echo 🔍 Checking service account file...
if exist "service-account-key.json" (
    echo ✅ Service account file found: service-account-key.json
) else (
    echo ❌ Service account file missing: service-account-key.json
    echo 📋 Please ensure the file is in the project root directory
    pause
    exit /b 1
)

echo.
echo 🧪 Running Google Drive connectivity test...
echo.
python test_google_drive_connectivity.py
echo.

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Connectivity test passed! Starting backend...
    echo.
    echo 🚀 Starting backend service...
    echo 📍 Backend will be available at: http://localhost:8001
    echo 📊 Status endpoint: http://localhost:8001/status
    echo 🧪 Test upload: http://localhost:8001/test-upload
    echo.
    echo Press Ctrl+C to stop the backend
    echo.
    python BACKEND_SERVICE_ACCOUNT.py
) else (
    echo.
    echo ❌ Connectivity test failed!
    echo 📋 Please fix the issues above before starting the backend
    echo.
    pause
)