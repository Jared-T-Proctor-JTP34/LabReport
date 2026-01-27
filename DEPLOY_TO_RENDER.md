# 🚀 Deploy to Render.com Guide

## Current Issue
Your Render backend is returning 404 errors, which means it's not properly deployed or configured.

## Quick Fix Steps

### 1. Check Render Dashboard
1. Go to https://render.com/dashboard
2. Look for your service: `pharmacy-compliance-backend`
3. Check if it's deployed and running

### 2. If Service Doesn't Exist - Create New Service
1. Click "New +" → "Web Service"
2. Connect your GitHub repository: `Jared-T-Proctor-JTP34/LabReport`
3. Configure:
   - **Name**: `pharmacy-compliance-backend`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python BACKEND_SERVICE_ACCOUNT.py`
   - **Plan**: Free

### 3. Environment Variables (CRITICAL)
Add these in Render Dashboard → Environment:

```
TARGET_EMAIL=labreporting1177@gmail.com
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
GOOGLE_PROJECT_ID=lap-reports
GOOGLE_CLIENT_ID=113380403214174229428
GOOGLE_CLIENT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

**IMPORTANT**: You also need to add the private key variables:
- `GOOGLE_PRIVATE_KEY` - The private key from your service account JSON
- `GOOGLE_PRIVATE_KEY_ID` - The private key ID from your service account JSON

### 4. Alternative - Use Simple Backend
If the full backend fails, you can deploy the simple version:

1. Change `render.yaml` start command to: `python simple_backend.py`
2. This provides basic endpoints without Google Drive integration

### 5. Test Deployment
After deployment, test these URLs:
- https://pharmacy-compliance-backend.onrender.com/
- https://pharmacy-compliance-backend.onrender.com/status
- https://pharmacy-compliance-backend.onrender.com/health

## Troubleshooting

### CORS Issues
✅ **Fixed**: Updated backend to explicitly allow your domain

### 404 Errors
❌ **Current Issue**: Service not deployed or wrong URL
- Check service name in Render dashboard
- Verify GitHub repository is connected
- Check build logs for errors

### Environment Variables Missing
⚠️ **Likely Issue**: Google service account credentials not set
- Add all required environment variables
- Ensure private key is properly formatted

## Quick Test Commands

```bash
# Test if service is accessible
curl https://pharmacy-compliance-backend.onrender.com/health

# Test status endpoint
curl https://pharmacy-compliance-backend.onrender.com/status
```

## Fallback Solution
The frontend now includes fallback URLs and will try:
1. Primary backend URL
2. Fallback backend URLs
3. Direct Google API (production only)
4. Local download (if all fail)

This ensures your application works even if the backend is temporarily unavailable.