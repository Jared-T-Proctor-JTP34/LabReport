# 🚨 RENDER SERVICE MANUAL RECOVERY

## Current Status: Service Account Backend Offline

### **IMMEDIATE ACTIONS NEEDED:**

#### **1. Check Render Dashboard**
- Go to: https://render.com
- Login to your account
- Find: `pharmacy-compliance-backend` service

#### **2. Service Recovery Options**

**Option A: Service Exists (Sleeping/Failed)**
1. Click on `pharmacy-compliance-backend` service
2. Click "Manual Deploy" button
3. Select "Deploy latest commit"
4. Wait 3-5 minutes for deployment

**Option B: Service Missing (Needs Recreation)**
1. Click "New +" → "Web Service"
2. Connect GitHub repository: `Jared-T-Proctor-JTP34/LabReport`
3. Configure:
   ```
   Name: pharmacy-compliance-backend
   Environment: Python 3
   Build Command: pip install -r requirements.txt
   Start Command: python BACKEND_SERVICE_ACCOUNT.py
   ```

#### **3. Critical Environment Variables**

**Set these in Render Dashboard → Environment tab:**
```
TARGET_EMAIL=labreporting1177@gmail.com
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
GOOGLE_PROJECT_ID=lap-reports
GOOGLE_CLIENT_ID=113380403214174229428
GOOGLE_PRIVATE_KEY_ID=087526c4e652380e51c861225f3af762f62d4310
GOOGLE_CLIENT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

**CRITICAL - Private Key:**
```
GOOGLE_PRIVATE_KEY=[FROM YOUR service-account-key.json FILE]
```

#### **4. Test Recovery**

After deployment completes:
1. **Test health**: https://pharmacy-compliance-backend.onrender.com/health
2. **Test status**: https://pharmacy-compliance-backend.onrender.com/status
3. **Expected response**: `{"status": "healthy"}`

#### **5. Common Issues & Solutions**

**Build Fails:**
- Check requirements.txt syntax
- Verify Python version compatibility
- Review build logs

**Service Won't Start:**
- Check environment variables (especially GOOGLE_PRIVATE_KEY)
- Verify start command: `python BACKEND_SERVICE_ACCOUNT.py`
- Check application logs

**Google Drive Connection Fails:**
- Verify service account credentials
- Check folder sharing permissions
- Ensure private key format is correct

#### **6. Expected Timeline**

- **Manual Deploy**: 3-5 minutes
- **New Service Creation**: 5-10 minutes
- **First Request (if sleeping)**: 30-60 seconds

#### **7. Success Indicators**

✅ **Service shows "Live" status**
✅ **Health endpoint returns 200 OK**
✅ **Status endpoint shows Google Drive ready**
✅ **Frontend connects successfully**

## **NEXT STEPS AFTER RECOVERY:**

1. **Test frontend connection**: https://labreporttool.xyz
2. **Verify status shows**: "Render Cloud Connected ✅"
3. **Test report generation**: Should upload to Google Drive
4. **Monitor service**: Check logs for any errors

## **PREVENTION:**

- **Free tier sleeps** after 15 minutes of inactivity
- **First request wakes it up** (30-60 second delay)
- **Consider Starter plan** ($7/month) for always-on service
- **Monitor via Render dashboard** for any issues

Your pharmacy compliance system will be back online once these steps are completed! 🚀