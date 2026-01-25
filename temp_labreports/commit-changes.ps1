# Simple commit script for Labreports repository
# Usage: .\commit-changes.ps1 "Your commit message"

param(
    [Parameter(Mandatory=$true)]
    [string]$Message
)

Write-Host "🚀 Committing changes to repository..." -ForegroundColor Green

# Navigate to repository root (parent of Labreports)
Set-Location ..

# Add all changes in Labreports folder
Write-Host "📁 Adding changes..." -ForegroundColor Yellow
git add Labreports/

# Commit with provided message
Write-Host "💾 Committing: $Message" -ForegroundColor Yellow
git commit -m $Message

# Push to GitHub
Write-Host "🌐 Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "✅ Changes successfully committed and pushed!" -ForegroundColor Green

# Return to Labreports directory
Set-Location Labreports