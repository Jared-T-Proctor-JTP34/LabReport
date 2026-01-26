# Move Project to Documents\labreports
Write-Host "========================================" -ForegroundColor Green
Write-Host "MOVING PROJECT TO DOCUMENTS\LABREPORTS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

$sourceDir = Get-Location
$targetDir = "$env:USERPROFILE\Documents\labreports"

Write-Host "📁 Source: $sourceDir" -ForegroundColor Yellow
Write-Host "📁 Target: $targetDir" -ForegroundColor Yellow

# Create target directory
if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Write-Host "✅ Created directory: $targetDir" -ForegroundColor Green
} else {
    Write-Host "✅ Directory exists: $targetDir" -ForegroundColor Green
}

# Copy all files
Write-Host "`n🚀 Copying all project files..." -ForegroundColor Cyan

try {
    # Copy all files (excluding directories for now)
    Get-ChildItem -File | ForEach-Object {
        Copy-Item $_.FullName "$targetDir\" -Force
        Write-Host "✅ $($_.Name)" -ForegroundColor Green
    }
    
    # Copy .vscode directory if it exists
    if (Test-Path ".vscode") {
        Copy-Item ".vscode" "$targetDir\.vscode" -Recurse -Force
        Write-Host "✅ .vscode directory" -ForegroundColor Green
    }
    
    # Copy .git directory if it exists
    if (Test-Path ".git") {
        Copy-Item ".git" "$targetDir\.git" -Recurse -Force
        Write-Host "✅ .git directory" -ForegroundColor Green
    }
    
    Write-Host "`n🎉 PROJECT MOVED SUCCESSFULLY!" -ForegroundColor Green
    Write-Host "📁 New location: $targetDir" -ForegroundColor Yellow
    
    # Open the new directory
    Start-Process "explorer.exe" -ArgumentList $targetDir
    
} catch {
    Write-Host "❌ Error during copy: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nPress any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")