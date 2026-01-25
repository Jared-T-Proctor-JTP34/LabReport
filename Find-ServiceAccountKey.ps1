# Find Service Account Key - PowerShell Script
# Comprehensive search for service-account-key.json file

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Locate service-account-key.json File" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Searching for service-account-key.json on your system..." -ForegroundColor Green
Write-Host ""

$found = $false
$foundFiles = @()

Write-Host "🔍 Checking common download locations..." -ForegroundColor Yellow
Write-Host ""

# Common locations to check
$commonLocations = @(
    "$env:USERPROFILE\Downloads\service-account-key.json",
    "$env:USERPROFILE\OneDrive\Downloads\service-account-key.json",
    "$env:USERPROFILE\Desktop\service-account-key.json",
    "$env:USERPROFILE\OneDrive\Desktop\service-account-key.json",
    "$(Get-Location)\service-account-key.json"
)

foreach ($location in $commonLocations) {
    if (Test-Path $location) {
        Write-Host "✅ FOUND: $location" -ForegroundColor Green
        $foundFiles += $location
        $found = $true
    }
}

Write-Host ""
Write-Host "🔍 Searching entire system (this may take a moment)..." -ForegroundColor Yellow
Write-Host ""

# Search entire system for the file
try {
    $systemFiles = Get-ChildItem -Path "C:\" -Name "service-account-key.json" -Recurse -ErrorAction SilentlyContinue
    foreach ($file in $systemFiles) {
        $fullPath = "C:\$file"
        Write-Host "✅ FOUND: $fullPath" -ForegroundColor Green
        $foundFiles += $fullPath
        $found = $true
    }
} catch {
    Write-Host "⚠️ System search encountered some access restrictions (normal)" -ForegroundColor Yellow
}

Write-Host ""

if (-not $found) {
    Write-Host "❌ service-account-key.json not found on this system" -ForegroundColor Red
    Write-Host ""
    Write-Host "📋 The file needs to be downloaded from Google Cloud Console:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://console.cloud.google.com/iam-admin/serviceaccounts" -ForegroundColor White
    Write-Host "2. Find: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com" -ForegroundColor White
    Write-Host "3. Click on the service account" -ForegroundColor White
    Write-Host "4. Go to 'Keys' tab" -ForegroundColor White
    Write-Host "5. Click 'Add Key' → 'Create new key'" -ForegroundColor White
    Write-Host "6. Select 'JSON' format" -ForegroundColor White
    Write-Host "7. Click 'Create'" -ForegroundColor White
    Write-Host "8. Save the downloaded file as 'service-account-key.json'" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "✅ Found service-account-key.json file(s) on your system!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📁 Found files:" -ForegroundColor Cyan
    foreach ($file in $foundFiles) {
        Write-Host "   $file" -ForegroundColor White
        
        # Try to validate the file
        try {
            $content = Get-Content $file | ConvertFrom-Json
            if ($content.type -eq "service_account") {
                Write-Host "   ✅ Valid service account key" -ForegroundColor Green
                Write-Host "   📧 Email: $($content.client_email)" -ForegroundColor Gray
                Write-Host "   🆔 Project: $($content.project_id)" -ForegroundColor Gray
            } else {
                Write-Host "   ⚠️ Not a service account key" -ForegroundColor Yellow
            }
        } catch {
            Write-Host "   ❌ Invalid JSON format" -ForegroundColor Red
        }
        Write-Host ""
    }
    
    Write-Host "🚀 Next steps:" -ForegroundColor Magenta
    Write-Host "1. Run ADD_SERVICE_ACCOUNT_KEY.bat to copy to project directory" -ForegroundColor White
    Write-Host "2. Or manually copy one of the found files to this directory" -ForegroundColor White
    Write-Host "3. Ensure the filename is exactly 'service-account-key.json'" -ForegroundColor White
}

Write-Host ""
Write-Host "📂 Also checking for similar JSON files that might be the service account key..." -ForegroundColor Yellow
Write-Host ""

# Look for any JSON files that might be service account keys
$jsonLocations = @(
    "$env:USERPROFILE\Downloads\*.json",
    "$env:USERPROFILE\Desktop\*.json",
    "$env:USERPROFILE\OneDrive\Downloads\*.json",
    "$env:USERPROFILE\OneDrive\Desktop\*.json"
)

foreach ($location in $jsonLocations) {
    try {
        $jsonFiles = Get-ChildItem -Path $location -ErrorAction SilentlyContinue
        foreach ($jsonFile in $jsonFiles) {
            Write-Host "📄 JSON file: $($jsonFile.FullName)" -ForegroundColor Gray
            
            # Check if it might be a service account key
            try {
                $content = Get-Content $jsonFile.FullName | ConvertFrom-Json
                if ($content.type -eq "service_account") {
                    Write-Host "   🔑 This is a service account key!" -ForegroundColor Cyan
                    Write-Host "   📧 Email: $($content.client_email)" -ForegroundColor Gray
                }
            } catch {
                # Not a valid JSON or not a service account key
            }
        }
    } catch {
        # Location not accessible
    }
}

Write-Host ""
Write-Host "💡 Tips:" -ForegroundColor Yellow
Write-Host "- The file might have been downloaded with a different name" -ForegroundColor White
Write-Host "- Check your browser's download history" -ForegroundColor White
Write-Host "- Look for files starting with your project name or 'lap-reports'" -ForegroundColor White
Write-Host "- The file should contain 'service_account' in its content" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"