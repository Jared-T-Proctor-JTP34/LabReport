# 🚀 Deploy Backend to Render - Step by Step

## Quick Deployment (5 minutes)

### Step 1: Go to Render Dashboard
1. **Open**: https://render.com/dashboard
2. **Sign in** with your GitHub account if not already signed in

### Step 2: Create New Web Service
1. **Click**: "New +" button (top right)
2. **Select**: "Web Service"
3. **Connect Repository**: 
   - If not connected: Click "Connect GitHub" and authorize
   - **Select**: `Jared-T-Proctor-JTP34/LabReport`
   - **Click**: "Connect"

### Step 3: Configure Service
**Fill in these exact settings:**

| Field | Value |
|-------|-------|
| **Name** | `pharmacy-compliance-backend` |
| **Environment** | `Python 3` |
| **Region** | `Oregon (US West)` or closest to you |
| **Branch** | `main` |
| **Root Directory** | `.` (leave empty/default) |
| **Build Command** | `pip install flask flask-cors` |
| **Start Command** | `python minimal_backend.py` |

### Step 4: Select Plan
- **Plan**: Select "Free" (should be pre-selected)
- **Click**: "Create Web Service"

### Step 5: Wait for Deployment
- **Status**: Watch the deployment logs
- **Time**: Usually takes 2-3 minutes
- **Success**: Look for "Your service is live at https://pharmacy-compliance-backend.onrender.com"

### Step 6: Test Deployment
Once deployed, test these URLs:
- https://pharmacy-compliance-backend.onrender.com/
- https://pharmacy-compliance-backend.onrender.com/status
- https://pharmacy-compliance-backend.onrender.com/health

**Expected Response**: JSON data without CORS errors

### Step 7: Verify Your App
1. **Visit**: https://labreporttool.xyz
2. **Check Console**: Should show "✅ Connected to backend"
3. **Status**: Should show "Backend Connected (Local Download Mode)"

## Troubleshooting

### If Service Name is Taken
Use alternative name:
- `pharmacy-backend-jtp34`
- `labreport-backend-2025`
- `compliance-backend-[your-initials]`

**Then update frontend**: Change line 571 in `Pharmacy_Compliance_Backend.html`

### If Build Fails
Check build logs for errors. Common fixes:
- Ensure `minimal_backend.py` exists in repo
- Verify Python syntax is correct
- Check that Flask/Flask-CORS install properly

### If CORS Still Fails
- Verify service is actually running
- Check service logs for errors
- Ensure the service URL matches your frontend configuration

## Next Steps After Deployment

### Immediate (Backend Working)
✅ **CORS errors gone**  
✅ **App shows "Backend Connected"**  
✅ **Reports download locally** (Google Drive not configured yet)

### Optional (Add Google Drive)
To enable automatic Google Drive uploads:
1. **Add Environment Variables** in Render dashboard
2. **Switch to full backend**: Change start command to `python BACKEND_SERVICE_ACCOUNT.py`
3. **Configure Google service account** credentials

## Alternative: Deploy via GitHub Actions

If manual deployment doesn't work, I can help you set up automatic deployment via GitHub Actions.

---

**Ready to deploy? Follow the steps above and let me know when you reach Step 6!**