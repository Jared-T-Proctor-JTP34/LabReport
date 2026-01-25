# Sync Render Deployment Settings to GitHub - PowerShell Script
# Pharmacy Compounding Compliance Log - Render Cloud Deployment

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Sync Render Deployment to GitHub" -ForegroundColor Yellow
Write-Host "Pharmacy Compounding Compliance Log" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport.git" -ForegroundColor Green
Write-Host "User: Jared T Proctor (jared9689098@gmail.com)" -ForegroundColor Green
Write-Host ""

# Check if git is available
try {
    $gitVersion = git --version
    Write-Host "Git Version: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git not found. Please install Git or add it to PATH." -ForegroundColor Red
    Write-Host "Download from: https://git-scm.com/download/windows" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 1: Checking Git Status..." -ForegroundColor Yellow
git status

Write-Host ""
Write-Host "Step 2: Adding Render deployment files..." -ForegroundColor Yellow
git add render.yaml
git add requirements.txt
git add BACKEND_SERVICE_ACCOUNT.py
git add Pharmacy_Compliance_Backend.html
git add RENDER_DEPLOYMENT_GUIDE.md
git add RENDER_MANUAL_DEPLOYMENT.md
git add RENDER_FIX_DEPLOYMENT.md
git add RENDER_ENV_VARIABLES.txt
git add DEPLOY_TO_RENDER.md
git add SYNC_RENDER_TO_GITHUB.bat
git add Sync-Render-GitHub.ps1

Write-Host ""
Write-Host "Step 3: Showing what will be committed..." -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "Step 4: Committing Render deployment configuration..." -ForegroundColor Yellow

$commitMessage = @"
Configure Render Cloud Deployment - Complete Backend Setup

✅ RENDER DEPLOYMENT READY:
- Updated render.yaml with explicit root directory configuration
- Fixed requirements.txt path issues for Render build process
- Updated BACKEND_SERVICE_ACCOUNT.py with Render environment variable support
- Updated Pharmacy_Compliance_Backend.html to use Render backend URL
- Created comprehensive deployment documentation

🚀 RENDER CONFIGURATION FILES:
- render.yaml: Service configuration with environment variables
- requirements.txt: Python dependencies for cloud deployment
- BACKEND_SERVICE_ACCOUNT.py: Production-ready backend with gunicorn
- RENDER_DEPLOYMENT_GUIDE.md: Step-by-step deployment instructions
- RENDER_FIX_DEPLOYMENT.md: Troubleshooting guide for common issues
- RENDER_ENV_VARIABLES.txt: Copy-paste ready environment variables

🔧 TECHNICAL IMPROVEMENTS:
- Backend URL updated to: https://pharmacy-compliance-backend.onrender.com
- Environment variable support for service account credentials
- Automatic HTTPS and professional cloud hosting
- Free tier deployment optimized for pharmacy compliance use

📋 DEPLOYMENT PROCESS:
1. Connect GitHub repository to Render
2. Configure service settings (manual configuration recommended)
3. Set environment variables for Google service account
4. Deploy and test integration

🎯 EXPECTED RESULT:
- Professional cloud backend on Render
- Automatic Google Drive uploads to labreporting1177@gmail.com
- 24/7 availability with free tier (750 hours/month)
- Seamless integration with existing frontend

Version: 2.4 - Render Cloud Deployment Ready
"@

git commit -m $commitMessage

Write-Host ""
Write-Host "Step 5: Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Render Settings Synced to GitHub! ✅" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "🚀 NEXT STEPS FOR RENDER DEPLOYMENT:" -ForegroundColor Magenta
Write-Host ""

Write-Host "1. Go to Render Dashboard:" -ForegroundColor Yellow
Write-Host "   https://render.com/" -ForegroundColor Blue
Write-Host ""

Write-Host "2. Create New Web Service:" -ForegroundColor Yellow
Write-Host "   - Click 'New +' → 'Web Service'" -ForegroundColor White
Write-Host "   - Select 'Build and deploy from a Git repository'" -ForegroundColor White
Write-Host "   - Connect: Jared-T-Proctor-JTP34/LabReport" -ForegroundColor White
Write-Host ""

Write-Host "3. Service Configuration:" -ForegroundColor Yellow
Write-Host "   Name: pharmacy-compliance-backend" -ForegroundColor White
Write-Host "   Environment: Python 3" -ForegroundColor White
Write-Host "   Branch: main" -ForegroundColor White
Write-Host "   Root Directory: (LEAVE BLANK!)" -ForegroundColor Red
Write-Host "   Build Command: pip install -r requirements.txt" -ForegroundColor White
Write-Host "   Start Command: python BACKEND_SERVICE_ACCOUNT.py" -ForegroundColor White
Write-Host ""

Write-Host "4. Set Environment Variables:" -ForegroundColor Yellow
Write-Host "   Use values from: RENDER_ENV_VARIABLES.txt" -ForegroundColor White
Write-Host ""

Write-Host "5. Deploy and Test:" -ForegroundColor Yellow
Write-Host "   Expected URL: https://pharmacy-compliance-backend.onrender.com" -ForegroundColor Blue
Write-Host ""

Write-Host "📚 DOCUMENTATION AVAILABLE:" -ForegroundColor Green
Write-Host "✅ RENDER_FIX_DEPLOYMENT.md - Troubleshooting guide" -ForegroundColor White
Write-Host "✅ RENDER_MANUAL_DEPLOYMENT.md - Complete deployment guide" -ForegroundColor White
Write-Host "✅ RENDER_ENV_VARIABLES.txt - Environment variables" -ForegroundColor White
Write-Host "✅ DEPLOY_TO_RENDER.md - Comprehensive setup guide" -ForegroundColor White
Write-Host ""

Write-Host "🎯 DEPLOYMENT BENEFITS:" -ForegroundColor Green
Write-Host "✅ Professional cloud hosting" -ForegroundColor White
Write-Host "✅ Automatic HTTPS" -ForegroundColor White
Write-Host "✅ Free tier (750 hours/month)" -ForegroundColor White
Write-Host "✅ Automatic Google Drive integration" -ForegroundColor White
Write-Host "✅ 24/7 availability" -ForegroundColor White
Write-Host ""

Write-Host "🚀 Ready for professional pharmacy compliance in the cloud!" -ForegroundColor Magenta
Write-Host ""

Read-Host "Press Enter to exit"