# Add Service Account Key - PowerShell Script
# Copies service-account-key.json from downloads to project directory

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Add Service Account Key File" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "This script will help you copy the service-account-key.json file" -ForegroundColor Green
Write-Host "from your downloads to the project directory." -ForegroundColor Green
Write-Host ""

Write-Host "Looking for service-account-key.json in common locations..." -ForegroundColor Yellow
Write-Host ""

$found = $false
$sourceFile = ""
$currentDir = Get-Location

# Common locations to check
$locations = @(
    "$env:USERPROFILE\Downloads\service-account-key.json",
    "$env:USERPROFILE\OneDrive\Downloads\service-account-key.json",
    "$env:USERPROFILE\Desktop\service-account-key.json",
    "$env:USERPROFILE\OneDrive\Desktop\service-account-key.json"
)

foreach ($location in $locations) {
    if (Test-Path $location) {
        $sourceFile = $location
        $found = $true
        Write-Host "✅ Found: $location" -ForegroundColor Green
        break
    }
}

Write-Host ""

if ($found) {
    Write-Host "Copying service-account-key.json to project directory..." -ForegroundColor Yellow
    
    try {
        Copy-Item $sourceFile -Destination "$currentDir\service-account-key.json"
        
        if (Test-Path "$currentDir\service-account-key.json") {
            Write-Host "✅ Service account key copied successfully!" -ForegroundColor Green
            Write-Host ""
            Write-Host "📋 File location: $currentDir\service-account-key.json" -ForegroundColor White
            Write-Host ""
            
            Write-Host "Verifying JSON file structure..." -ForegroundColor Yellow
            Write-Host ""
            Write-Host "First few lines of the file:" -ForegroundColor White
            Write-Host "----------------------------------------" -ForegroundColor Gray
            
            $content = Get-Content "$currentDir\service-account-key.json" | Select-Object -First 10
            $content | ForEach-Object { Write-Host $_ -ForegroundColor Gray }
            
            Write-Host "----------------------------------------" -ForegroundColor Gray
            Write-Host ""
            
            # Validate JSON structure
            try {
                $json = Get-Content "$currentDir\service-account-key.json" | ConvertFrom-Json
                
                if ($json.type -eq "service_account") {
                    Write-Host "✅ Valid service account JSON structure confirmed!" -ForegroundColor Green
                    Write-Host "📧 Service account email: $($json.client_email)" -ForegroundColor White
                    Write-Host "🆔 Project ID: $($json.project_id)" -ForegroundColor White
                } else {
                    Write-Host "⚠️ JSON file may not be a service account key" -ForegroundColor Yellow
                }
            } catch {
                Write-Host "⚠️ Could not parse JSON file - please verify it's valid" -ForegroundColor Yellow
            }
            
            Write-Host ""
            Write-Host "✅ Service account key is ready!" -ForegroundColor Green
            Write-Host ""
            Write-Host "🚀 NEXT STEPS:" -ForegroundColor Magenta
            Write-Host "1. Share Google Drive folder with service account email" -ForegroundColor White
            Write-Host "2. Run: python BACKEND_SERVICE_ACCOUNT.py" -ForegroundColor White
            Write-Host "3. Test: http://localhost:8001/status" -ForegroundColor White
            Write-Host "4. Verify: Upload functionality works" -ForegroundColor White
            Write-Host ""
            
        } else {
            Write-Host "❌ Failed to copy service account key" -ForegroundColor Red
            Write-Host "Please manually copy the file to: $currentDir" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "❌ Error copying file: $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
    Write-Host "❌ service-account-key.json not found in common locations" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please manually copy the file to this directory:" -ForegroundColor Yellow
    Write-Host "$currentDir" -ForegroundColor White
    Write-Host ""
    Write-Host "Common download locations to check:" -ForegroundColor Yellow
    Write-Host "- $env:USERPROFILE\Downloads\" -ForegroundColor Gray
    Write-Host "- $env:USERPROFILE\OneDrive\Downloads\" -ForegroundColor Gray
    Write-Host "- $env:USERPROFILE\Desktop\" -ForegroundColor Gray
    Write-Host "- $env:USERPROFILE\OneDrive\Desktop\" -ForegroundColor Gray
    Write-Host ""
    Write-Host "The file should be named exactly: service-account-key.json" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Write-Host "📋 Service Account Information:" -ForegroundColor Cyan
Write-Host "Email: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com" -ForegroundColor White
Write-Host "Target: labreporting1177@gmail.com" -ForegroundColor White
Write-Host "Folder: 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"