@echo off
echo ========================================
echo Start Google Drive Backend Service
echo ========================================
echo.

echo Service Account Backend for Pharmacy Compliance Log
echo Target Email: labreporting1177@gmail.com
echo Service Account: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
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
    echo Please ensure the service account key file is in this directory.
    echo Run ADD_SERVICE_ACCOUNT_KEY.bat if you need to add it.
    echo.
    pause
    exit /b 1
)

REM Check if backend script exists
if not exist "BACKEND_SERVICE_ACCOUNT.py" (
    echo ❌ Backend script not found: BACKEND_SERVICE_ACCOUNT.py
    echo.
    echo Please ensure the backend script is in this directory.
    echo.
    pause
    exit /b 1
)

echo ✅ Python found
echo ✅ Service account key file found
echo ✅ Backend script found
echo.

echo Installing required Python packages...
pip install flask flask-cors google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

echo.
echo Starting backend service...
echo.
echo 🌐 Backend will be available at: http://localhost:8001
echo 📊 Status endpoint: http://localhost:8001/status
echo 🧪 Test upload: http://localhost:8001/test-upload
echo 📋 Setup guide: http://localhost:8001/setup-guide
echo.
echo Press Ctrl+C to stop the service
echo.

python BACKEND_SERVICE_ACCOUNT.py