# Start Google Drive Backend Service - PowerShell Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Start Google Drive Backend Service" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Service Account Backend for Pharmacy Compliance Log" -ForegroundColor Green
Write-Host "Target Email: labreporting1177@gmail.com" -ForegroundColor White
Write-Host "Service Account: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com" -ForegroundColor White
Write-Host ""

# Check if Python is available
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✅ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Python not found. Please install Python 3.7+ and try again." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if service account file exists
if (-not (Test-Path "service-account-key.json")) {
    Write-Host "❌ Service account key file not found: service-account-key.json" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please ensure the service account key file is in this directory." -ForegroundColor Yellow
    Write-Host "Run ADD_SERVICE_ACCOUNT_KEY.bat if you need to add it." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if backend script exists
if (-not (Test-Path "BACKEND_SERVICE_ACCOUNT.py")) {
    Write-Host "❌ Backend script not found: BACKEND_SERVICE_ACCOUNT.py" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please ensure the backend script is in this directory." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✅ Service account key file found" -ForegroundColor Green
Write-Host "✅ Backend script found" -ForegroundColor Green
Write-Host ""

Write-Host "Installing required Python packages..." -ForegroundColor Yellow
pip install flask flask-cors google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

Write-Host ""
Write-Host "Starting backend service..." -ForegroundColor Yellow
Write-Host ""
Write-Host "🌐 Backend will be available at: http://localhost:8001" -ForegroundColor Cyan
Write-Host "📊 Status endpoint: http://localhost:8001/status" -ForegroundColor White
Write-Host "🧪 Test upload: http://localhost:8001/test-upload" -ForegroundColor White
Write-Host "📋 Setup guide: http://localhost:8001/setup-guide" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop the service" -ForegroundColor Yellow
Write-Host ""

# Start the backend service
python BACKEND_SERVICE_ACCOUNT.py