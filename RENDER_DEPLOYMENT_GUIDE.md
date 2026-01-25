# 🚀 Render Deployment - Step-by-Step Guide

## 🎯 **QUICK DEPLOYMENT CHECKLIST**

### **✅ Files Ready for Render:**
- `render.yaml` - Render configuration
- `requirements.txt` - Python dependencies  
- `BACKEND_SERVICE_ACCOUNT.py` - Updated for Render
- Service account credentials (as environment variables)

## 📋 **STEP 1: PREPARE GITHUB REPOSITORY**

### **Push Updated Files:**
```bash
# Add all Render-ready files
git add .
git commit -m "Prepare backend for Render deployment

✅ Added render.yaml configuration
✅ Updated BACKEND_SERVICE_ACCOUNT.py for environment variables
✅ Added requirements.txt for Render
✅ Ready for cloud deployment with automatic Google Drive integration"

git push origin main
```

## 🚀 **STEP 2: DEPLOY TO RENDER**

### **Option A: GitHub Integration (Recommended)**

1. **Go to**: https://render.com/
2. **Sign up/Login** with your GitHub account
3. **Click**: "New +" → "Web Service"
4. **Connect Repository**: `Jared-T-Proctor-JTP34/LabReport`
5. **Configure Service**:
   ```
   Name: pharmacy-compliance-backend
   Environment: Python 3
   Build Command: pip install -r requirements.txt
   Start Command: python BACKEND_SERVICE_ACCOUNT.py
   ```

### **Service Configuration:**
```
Name: pharmacy-compliance-backend
Environment: Python 3
Region: Oregon (US West) or Ohio (US East)
Branch: main
Build Command: pip install -r requirements.txt
Start Command: python BACKEND_SERVICE_ACCOUNT.py
Plan: Free (or Starter $7/month for always-on)
```

## 🔧 **STEP 3: SET ENVIRONMENT VARIABLES**

### **Critical: Add These Environment Variables in Render Dashboard**

**Go to**: Service → Environment tab

**Add these variables:**
```
PORT=10000
TARGET_EMAIL=labreporting1177@gmail.com
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
GOOGLE_PROJECT_ID=lap-reports
GOOGLE_CLIENT_ID=113380403214174229428
```

**From your service-account-key.json file, add:**
```
GOOGLE_PRIVATE_KEY_ID=087526c4e652380e51c861225f3af762f62d4310
GOOGLE_CLIENT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

**CRITICAL - Private Key:**
```
GOOGLE_PRIVATE_KEY=-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCt7A1Wg0u10kG/\ngDPiX/V0hr2YBBqzJzvl5IKhidqH2NOovyNhTPZN68CSHsLALSLwkdno2exvcx4k\nxXkxMeEi5S5ka2GJlRzQGlroUbS0099Yg2JBnahHtEd8nAsppK6a99Vc2pLmAx84\n6ZHFSmq3EiGgpXn+rZDt0NXjwpdo4P1NsswSd11sKIsvvoZptnvNH9djNqAvl34B\nYkFYT6/1H9tngOM4N7IG12w33Ak/3zwj1vE8F0d7+5Zl/zLMEsvv9IJ/IhlUruLa\n/vqfv6/mLPndOPJ7EHD6G27bot7/ZhT4IJ4xkOzXoeGAj8zLv0j30ZsxK2QkidYD\nYfoaD893AgMBAAECggEAPe2AvE7I3QduSMlV8COZ6zF0/dVsSmFMdym8B9flm5xt\nlTbl2qYER6+LpJvWXYZU3BMa48oA4Zg8Yfx8kDNCBmJTeAcyNkKFfWX8+57oOMD+\nVG6HxHRmMI31LF4FrYDJeT2I1+SuDL+M1P9526WJRQFsPt7dBv13Tu6e0lf+AKYQ\nuUhPANSLgMDi0r8yfCs07ErbblwncivrQ0w5pX6/0M6Yapdwuc0VqUDVQnzZ8/0C\nNhOR7CwFOq6DPo/lzL3Z7eRYEAtlbiNRCuUm9ktLope0M5E50yKqWsHk/+wZPMOV\nmvB/xzuaa92E4fN2aDY27yJdAmYzPa+Doa9p1kBdeQKBgQDuWaC31X7KdDHuIip9\nBwwTlFDb3c7/+r6O8WlvMJFKM3YSqAccJkc7DkZn2WcQ+4mur0LsXm2tSguuQHMp\nQmO9oVny6PmDbgqHRn6CHONhCGKt643Odd0G7DzY+KT3dX8790Gk/QeZFmEQAfCt\nvurYAqWgIcIfavKX+WCnZxW8OQKBgQC6zRIJmzeeDQno22vcSDPyl3l/pXcCKcNm\nTvE2q1GI4hTuAcQWcwYnVULR4S9A5I60yfJkWBv/UtWxn3cRnxoU0h///ZfvfCTh\nLOf3l85Fr3P2N9/cNaQKxupl1prqrBfN94dOeF4mw/2wC9FjptNdUoQIesgjlxBp\nmxrUOZZJLwKBgFWY+o8KrS4n7IaI3ploHn4plaBgWCa19hl/uU2lM4hiUtUAYw1I\n8evThJVnDgybSSbi6jXY86p4HRnHK5R1szw25gbGhFUe/8j1GBnCJiaCzG2JWrP6\nwBXsYS3KnfQAzmDKu1h1RnVEBDererPrDIvm53RKq1x9HAJYHM4Bx1yBAoGABSLi\nXhVAgD4HibmOy63Ij+EOXC4miY6war288C3hvgvJW4n85EkhYC99+NtiOzyNl/b9\njTjG/ExAx/OEiJ2BUBU/AADvDoyxTue3MR2hdFUQsTJ0G0/2RL2XcFloRQ+aT/WA\naO3yWMqGzTJl/YF2ylgcfUcy/ZeHwf+byz4SHc0CgYB5icg7xfjeFym+1by3FgRS\npzExn2JEdLMqApmFi1Gy9DzpTWaugrtyT/5dP3JV1F5BlwXtJ2o08RiYjCpsBo+q\nxx9VMbLC7SIg0vq3I57xpL8l8EDR10kGvMIaAPcs9BfGNW3tJoXOVreqv4JW4zuQ\nyYjM6VugA3I1G0W3MxXPOA==\n-----END PRIVATE KEY-----\n
```

**⚠️ Important**: Copy the entire private key including `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----`, and replace actual newlines with `\n`

## 🔄 **STEP 4: DEPLOY AND TEST**

### **Deployment Process:**
1. **Save environment variables** → Triggers automatic deployment
2. **Monitor build logs** in Render dashboard
3. **Wait for "Live" status** (usually 2-3 minutes)
4. **Test endpoints**

### **Your Render URL:**
```
https://pharmacy-compliance-backend.onrender.com
```

### **Test Endpoints:**
```bash
# Status check
https://pharmacy-compliance-backend.onrender.com/status

# Test upload
https://pharmacy-compliance-backend.onrender.com/test-upload
```

## 📊 **STEP 5: UPDATE FRONTEND**

### **Update Pharmacy_Compliance_Backend.html:**
```javascript
// Configuration
const CONFIG = {
  // Dynamic backend URL based on environment
  BACKEND_URL: isDevelopment ? 'http://localhost:8001' : 'https://pharmacy-compliance-backend.onrender.com',
  
  // Service Account Configuration
  USE_SERVICE_ACCOUNT: true,
  TARGET_EMAIL: 'labreporting1177@gmail.com',
  SERVICE_ACCOUNT_EMAIL: 'pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com',
  TARGET_FOLDER_ID: '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc',
  
  // Environment info
  ENVIRONMENT: isDevelopment ? 'development' : 'production',
  
  // ... rest of config
};
```

### **Deploy Updated Frontend:**
```bash
git add Pharmacy_Compliance_Backend.html
git commit -m "Update frontend to use Render backend URL"
git push origin main
```

## 🧪 **STEP 6: TEST COMPLETE INTEGRATION**

### **Test Sequence:**
1. **Visit**: https://labreporttool.xyz
2. **Check status**: Should show "Google Drive Connected (Service Account)"
3. **Login**: Use demo credentials (`admin`/`pharmacy123`)
4. **Record data**: Enter temperature, humidity, initials
5. **Generate report**: Click "Record & Generate Report"
6. **Verify upload**: Check `labreporting1177@gmail.com` Google Drive

### **Expected Results:**
- ✅ **Status**: "Google Drive Connected (Service Account)"
- ✅ **No authentication prompts**
- ✅ **PDF uploads automatically**
- ✅ **Files appear in Google Drive**
- ✅ **24/7 availability**

## 💰 **RENDER PRICING**

### **Free Tier (Perfect for Pharmacy Use):**
- ✅ **$0/month**
- ✅ **750 hours/month** runtime
- ✅ **Sleeps after 15 minutes** of inactivity
- ✅ **Wakes up automatically** on request
- ✅ **HTTPS included**

### **Starter Tier ($7/month):**
- ✅ **Always on** - No sleeping
- ✅ **Faster response times**
- ✅ **More resources**

## 🚨 **TROUBLESHOOTING**

### **Build Failures:**
- Check `requirements.txt` syntax
- Verify Python version compatibility
- Review build logs in Render dashboard

### **Environment Variable Issues:**
- Ensure all variables are set correctly
- Check for typos in variable names
- Verify private key format (newlines as `\n`)

### **Google Drive Connection Fails:**
- Verify service account credentials
- Check folder sharing permissions
- Ensure folder ID is correct

### **Service Won't Start:**
- Check start command: `python BACKEND_SERVICE_ACCOUNT.py`
- Verify port configuration (PORT=10000)
- Review application logs in Render dashboard

## ✅ **SUCCESS INDICATORS**

You'll know deployment worked when:
- ✅ **Build completes** without errors in Render dashboard
- ✅ **Service shows "Live"** status
- ✅ **Status endpoint** returns valid JSON response
- ✅ **Google Drive test** uploads file successfully
- ✅ **Frontend connects** to Render backend
- ✅ **PDF reports upload** to `labreporting1177@gmail.com`

## 🎉 **FINAL RESULT**

After successful deployment:
- 🚀 **24/7 backend availability** on Render
- 📁 **Automatic Google Drive uploads** to `labreporting1177@gmail.com`
- 💰 **Cost-effective** - Free tier for most usage
- 🔒 **Secure** - Environment variables protect credentials
- 📊 **Professional** - Production-ready pharmacy compliance system

**Your pharmacy compliance application is now running professionally on Render! 🚀**