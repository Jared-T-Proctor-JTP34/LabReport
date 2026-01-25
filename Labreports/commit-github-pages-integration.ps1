# GitHub Pages Integration Commit Script
# Run this script to commit the GitHub Pages + Google API integration changes

Write-Host "🚀 Committing GitHub Pages Integration Updates..." -ForegroundColor Green

# Navigate to repository root (parent of Labreports)
Set-Location ..

# Check git status
Write-Host "📊 Checking git status..." -ForegroundColor Yellow
git status

# Add all changes in Labreports folder
Write-Host "📁 Adding Labreports changes..." -ForegroundColor Yellow
git add Labreports/

# Commit with descriptive message
$commitMessage = "feat: Add GitHub Pages + Google API integration

✅ Environment detection (local vs GitHub Pages)
✅ Dual integration: Backend service + Direct Google API
✅ Click-to-authenticate flow for GitHub Pages
✅ Enhanced status indicators with tooltips
✅ GitHub Actions workflow for automatic deployment
✅ Smart fallbacks for offline scenarios
✅ Updated documentation and setup guides

Version 2.2 - Ready for production deployment at labreporttool.xyz"

Write-Host "💾 Committing changes..." -ForegroundColor Yellow
git commit -m $commitMessage

# Push to GitHub
Write-Host "🌐 Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "✅ GitHub Pages integration successfully committed and pushed!" -ForegroundColor Green
Write-Host "🌍 Your application will be available at:" -ForegroundColor Cyan
Write-Host "   • https://labreporttool.xyz" -ForegroundColor White
Write-Host "   • https://jared-t-proctor-jtp34.github.io/LabReport/" -ForegroundColor White
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Configure Google Cloud Console (see GITHUB_GOOGLE_API_SETUP.md)" -ForegroundColor White
Write-Host "   2. Test the application on GitHub Pages" -ForegroundColor White
Write-Host "   3. Click the status symbol to authenticate with Google Drive" -ForegroundColor White

# Return to Labreports directory
Set-Location Labreports