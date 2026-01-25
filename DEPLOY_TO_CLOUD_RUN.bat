@echo off
echo ========================================
echo Deploy to Google Cloud Run
echo ========================================
echo.

echo This script will deploy your pharmacy compliance backend
echo to Google Cloud Run for 24/7 availability.
echo.

echo 📋 Prerequisites:
echo - Google Cloud CLI installed
echo - Authenticated with Google Cloud
echo - Project 'lap-reports' selected
echo.

REM Check if gcloud is installed
gcloud version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Google Cloud CLI not found.
    echo.
    echo Please install Google Cloud CLI:
    echo https://cloud.google.com/sdk/docs/install
    echo.
    pause
    exit /b 1
)

echo ✅ Google Cloud CLI found
echo.

echo Checking authentication...
gcloud auth list --filter=status:ACTIVE --format="value(account)" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Not authenticated with Google Cloud
    echo.
    echo Please run: gcloud auth login
    echo.
    pause
    exit /b 1
)

echo ✅ Authenticated with Google Cloud
echo.

echo Setting project to lap-reports...
gcloud config set project lap-reports

echo.
echo 🚀 Deploying to Google Cloud Run...
echo.
echo This will:
echo 1. Build your application container
echo 2. Deploy to Cloud Run
echo 3. Provide a public HTTPS URL
echo 4. Enable automatic scaling
echo.

set /p confirm="Continue with deployment? (y/N): "

if /i "%confirm%"=="y" (
    echo.
    echo Deploying pharmacy-compliance-backend...
    
    gcloud run deploy pharmacy-compliance-backend ^
        --source . ^
        --platform managed ^
        --region us-central1 ^
        --allow-unauthenticated ^
        --port 8080 ^
        --memory 512Mi ^
        --cpu 1 ^
        --min-instances 0 ^
        --max-instances 10 ^
        --timeout 300
    
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo Deployment Successful! ✅
        echo ========================================
        echo.
        echo Your backend is now running on Google Cloud Run!
        echo.
        echo 🌐 Service URL will be displayed above
        echo 📊 Status: [URL]/status
        echo 🧪 Test: [URL]/test-upload
        echo.
        echo 🔧 Next steps:
        echo 1. Copy the service URL from above
        echo 2. Update BACKEND_URL in Pharmacy_Compliance_Backend.html
        echo 3. Deploy updated frontend to GitHub
        echo 4. Test complete integration
        echo.
    ) else (
        echo.
        echo ❌ Deployment failed. Please check the error messages above.
    )
) else (
    echo.
    echo Deployment cancelled.
)

echo.
pause