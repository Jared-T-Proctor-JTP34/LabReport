# 🚀 Deploy Backend as Separate Service

## Current Situation
- ✅ **Frontend**: `www.labreporttool.xyz` (working)
- ❌ **Backend**: Needs separate deployment

## Deploy Backend Service

### Step 1: Create New Web Service
1. **Go to**: https://render.com/dashboard
2. **Click**: "New +" → "Web Service"
3. **Connect**: `Jared-T-Proctor-JTP34/LabReport` (same repo)

### Step 2: Configure Backend Service
**Use these settings:**

| Field | Value |
|-------|-------|
| **Name** | `pharmacy-backend-api` |
| **Environment** | `Python 3` |
| **Build Command** | `pip install flask flask-cors` |
| **Start Command** | `python minimal_backend.py` |
| **Plan** | `Free` |

### Step 3: Deploy
- **Click**: "Create Web Service"
- **Wait**: 2-3 minutes for deployment
- **URL**: Will be `https://pharmacy-backend-api.onrender.com`

### Step 4: Test Backend
Run this command to test:
```bash
python quick_test.py
```

Should show:
```
✅ Status: 200
📋 Service: Pharmacy Compliance Backend - Minimal
🔧 Status: running
🎉 SUCCESS: Backend is working!
```

### Step 5: Update Frontend (Already Done)
The frontend code is already updated to use the new backend URL.

### Step 6: Test Full App
1. **Visit**: https://labreporttool.xyz (or www.labreporttool.xyz)
2. **Check Console**: Should show "✅ Connected to backend"
3. **Status**: Should show "Backend Connected"

## What You'll Have After This:

### Two Separate Services:
1. **Static Site**: `www.labreporttool.xyz` (frontend)
2. **Web Service**: `pharmacy-backend-api.onrender.com` (backend API)

### Working Features:
- ✅ **No CORS errors**
- ✅ **Backend connectivity**
- ✅ **Report generation**
- ✅ **Local download mode**

## Alternative Service Names
If `pharmacy-backend-api` is taken, try:
- `pharmacy-api-2025`
- `labreport-api`
- `compliance-backend-api`

Then update the URL in `Pharmacy_Compliance_Backend.html` line 571.

---

**Ready to deploy the backend service?**