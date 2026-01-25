# Add Google HTML Verification File - PowerShell Script
# Copies Google verification file from desktop and syncs to GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Add Google HTML Verification File" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "This script will help you copy the Google verification HTML file" -ForegroundColor Green
Write-Host "from your desktop to the repository and sync it to GitHub." -ForegroundColor Green
Write-Host ""

Write-Host "Step 1: Locate your Google verification file" -ForegroundColor Yellow
Write-Host "The file should be named something like:" -ForegroundColor White
Write-Host "- google[verification-code].html" -ForegroundColor Gray
Write-Host "- googleabcdef123456.html" -ForegroundColor Gray
Write-Host "- Similar pattern with your verification code" -ForegroundColor Gray
Write-Host ""

$filename = Read-Host "Enter the exact filename of your Google verification file"

if ([string]::IsNullOrWhiteSpace($filename)) {
    Write-Host "Error: No filename provided" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 2: Copy file from desktop" -ForegroundColor Yellow
Write-Host "Copying $filename from desktop to repository..." -ForegroundColor White

$desktopPaths = @(
    "$env:USERPROFILE\Desktop\$filename",
    "$env:USERPROFILE\OneDrive\Desktop\$filename"
)

$fileCopied = $false
$currentDir = Get-Location

foreach ($path in $desktopPaths) {
    if (Test-Path $path) {
        Copy-Item $path -Destination "$currentDir\$filename"
        Write-Host "✅ File copied successfully from: $path" -ForegroundColor Green
        $fileCopied = $true
        break
    }
}

if (-not $fileCopied) {
    Write-Host "❌ File not found on Desktop or OneDrive Desktop" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please manually copy the file to this directory:" -ForegroundColor Yellow
    Write-Host "$currentDir" -ForegroundColor White
    Write-Host ""
    Write-Host "Then press any key to continue..." -ForegroundColor Yellow
    Read-Host
}

Write-Host ""
Write-Host "Step 3: Verify file exists in repository" -ForegroundColor Yellow

if (Test-Path "$currentDir\$filename") {
    Write-Host "✅ Verification file found: $filename" -ForegroundColor Green
    Write-Host "File contents:" -ForegroundColor White
    Get-Content "$currentDir\$filename"
    Write-Host ""
} else {
    Write-Host "❌ Verification file not found in repository" -ForegroundColor Red
    Write-Host "Please manually copy $filename to this directory and run the script again" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 4: Add to Git and push to GitHub" -ForegroundColor Yellow

Write-Host "Adding $filename to Git..." -ForegroundColor White
git add $filename

Write-Host ""
Write-Host "Committing changes..." -ForegroundColor White

$commitMessage = @"
Add Google HTML verification file: $filename

✅ Domain Verification Setup
- Added Google HTML verification file for labreporttool.xyz
- File: $filename
- This enables domain ownership verification in Google Search Console
- Required for OAuth consent screen configuration with custom domain

🎯 Next Steps:
1. Verify domain in Google Search Console
2. Update OAuth consent screen with labreporttool.xyz URLs
3. Test Google Drive integration with verified domain
"@

git commit -m $commitMessage

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor White
git push origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Google Verification File Added! ✅" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "File added: $filename" -ForegroundColor Green
Write-Host "Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport" -ForegroundColor Blue
Write-Host ""

Write-Host "The file will be accessible at:" -ForegroundColor Green
Write-Host "https://labreporttool.xyz/$filename" -ForegroundColor Blue
Write-Host "https://jared-t-proctor-jtp34.github.io/LabReport/$filename" -ForegroundColor Blue
Write-Host ""

Write-Host "🎯 NEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Wait 2-3 minutes for GitHub Pages to deploy" -ForegroundColor White
Write-Host "2. Go to Google Search Console: https://search.google.com/search-console/" -ForegroundColor White
Write-Host "3. Add property: https://labreporttool.xyz" -ForegroundColor White
Write-Host "4. Choose 'HTML file' verification method" -ForegroundColor White
Write-Host "5. Confirm the filename matches: $filename" -ForegroundColor White
Write-Host "6. Click 'Verify'" -ForegroundColor White
Write-Host ""

Write-Host "📋 After successful verification:" -ForegroundColor Yellow
Write-Host "1. Update OAuth consent screen with labreporttool.xyz URLs" -ForegroundColor White
Write-Host "2. Test Google Drive authentication" -ForegroundColor White
Write-Host "3. Verify application works with custom domain" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"