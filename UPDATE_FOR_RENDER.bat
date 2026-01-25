@echo off
echo ========================================
echo Updating Repository for Render Deployment
echo ========================================
echo.

echo Adding updated files...
git add Pharmacy_Compliance_Backend.html
git add SERVICE_ACCOUNT_SETUP_GUIDE.md
git add DEPLOY_TO_RENDER.md
git add RENDER_DEPLOYMENT_GUIDE.md
git add BACKEND_SERVICE_ACCOUNT.py
git add render.yaml
git add requirements.txt

echo.
echo Committing Render deployment updates...
git commit -m "Update frontend for Render backend deployment

✅ RENDER DEPLOYMENT READY:
- Updated BACKEND_URL to use Render: https://pharmacy-compliance-backend.onrender.com
- Backend optimized for Render with environment variables
- Complete deployment documentation created
- Service account authentication configured for cloud deployment

🚀 DEPLOYMENT FILES:
- render.yaml: Render service configuration
- requirements.txt: Python dependencies for Render
- BACKEND_SERVICE_ACCOUNT.py: Cloud-ready backend with gunicorn
- DEPLOY_TO_RENDER.md: Complete deployment guide
- RENDER_DEPLOYMENT_GUIDE.md: Step-by-step instructions

🔧 CONFIGURATION:
- Frontend points to Render backend URL
- Environment variable support for service account credentials
- Automatic HTTPS and professional hosting
- Free tier deployment ready

🎯 NEXT STEP: Deploy to Render using GitHub integration
- Connect repository to Render
- Set environment variables for service account
- Test complete integration

Version: 2.3 - Render Cloud Ready"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo Update Complete! Ready for Render Deployment
echo ========================================
echo.
echo Next Steps:
echo 1. Go to https://render.com/
echo 2. Connect your GitHub repository
echo 3. Deploy the backend service
echo 4. Set environment variables
echo 5. Test the integration
echo.
pause