@echo off
echo ========================================
echo Sync Render Deployment Settings to GitHub
echo ========================================
echo.

echo Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport.git
echo User: Jared T Proctor (jared9689098@gmail.com)
echo.

echo Step 1: Checking Git Status...
git status
echo.

echo Step 2: Adding Render deployment files...
git add render.yaml
git add requirements.txt
git add BACKEND_SERVICE_ACCOUNT.py
git add Pharmacy_Compliance_Backend.html
git add RENDER_DEPLOYMENT_GUIDE.md
git add RENDER_MANUAL_DEPLOYMENT.md
git add RENDER_FIX_DEPLOYMENT.md
git add RENDER_ENV_VARIABLES.txt
git add DEPLOY_TO_RENDER.md

echo.
echo Step 3: Showing what will be committed...
git status --short
echo.

echo Step 4: Committing Render deployment configuration...
git commit -m "Configure Render Cloud Deployment - Complete Backend Setup

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

Version: 2.4 - Render Cloud Deployment Ready"

echo.
echo Step 5: Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo Render Settings Synced to GitHub! ✅
echo ========================================
echo.

echo 🚀 Next Steps:
echo 1. Go to https://render.com/
echo 2. Create new Web Service from GitHub
echo 3. Connect repository: Jared-T-Proctor-JTP34/LabReport
echo 4. Use manual configuration (not render.yaml)
echo 5. Set environment variables from RENDER_ENV_VARIABLES.txt
echo 6. Deploy and test!
echo.

echo 📋 Documentation Available:
echo - RENDER_FIX_DEPLOYMENT.md (troubleshooting)
echo - RENDER_MANUAL_DEPLOYMENT.md (complete guide)
echo - RENDER_ENV_VARIABLES.txt (environment variables)
echo.

echo 🌐 Expected Backend URL:
echo https://pharmacy-compliance-backend.onrender.com
echo.

pause