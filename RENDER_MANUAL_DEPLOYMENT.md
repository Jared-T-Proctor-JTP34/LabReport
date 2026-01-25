# 🚀 Manual Render Deployment Guide

## 🎯 **CURRENT STATUS**
✅ All files are ready for Render deployment  
✅ Backend supports environment variables  
✅ Frontend configured for Render URL  
✅ Service account authentication ready  

## 📋 **STEP 1: DEPLOY TO RENDER**

### **Go to Render Dashboard:**
1. Visit: https://render.com/
2. Sign up/Login with your GitHub account
3. Click "New +" → "Web Service"

### **Connect Repository:**
1. Select "Build and deploy from a Git repository"
2. Connect to GitHub: `Jared-T-Proctor-JTP34/LabReport`
3. Click "Connect" next to your repository

### **Service Configuration:**
```
Name: pharmacy-compliance-backend
Environment: Python 3
Region: Oregon (US West) - recommended
Branch: main
Root Directory: (leave blank)
Build Command: pip install -r requirements.txt
Start Command: python BACKEND_SERVICE_ACCOUNT.py
```

### **Plan Selection:**
- **Free Plan**: Perfect for pharmacy use (750 hours/month)
- **Starter Plan ($7/month)**: If you need 24/7 uptime

## 🔧 **STEP 2: SET ENVIRONMENT VARIABLES**

### **In Render Dashboard:**
1. Go to your service → "Environment" tab
2. Add these variables one by one:

### **Basic Configuration:**
```
PORT = 10000
TARGET_EMAIL = labreporting1177@gmail.com
TARGET_FOLDER_ID = 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
SERVICE_ACCOUNT_EMAIL = pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

### **Google Service Account (from your service-account-key.json):**
```
GOOGLE_PROJECT_ID = lap-reports
GOOGLE_CLIENT_ID = 113380403214174229428
GOOGLE_PRIVATE_KEY_ID = 087526c4e652380e51c861225f3af762f62d4310
GOOGLE_CLIENT_EMAIL = pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

### **⚠️ CRITICAL - Private Key:**
```
GOOGLE_PRIVATE_KEY = -----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCt7A1Wg0u10kG/\ngDPiX/V0hr2YBBqzJzvl5IKhidqH2NOovyNhTPZN68CSHsLALSLwkdno2exvcx4k\nxXkxMeEi5S5ka2GJlRzQGlroUbS0099Yg2JBnahHtEd8nAsppK6a99Vc2pLmAx84\n6ZHFSmq3EiGgpXn+rZDt0NXjwpdo4P1NsswSd11sKIsvvoZptnvNH9djNqAvl34B\nYkFYT6/1H9tngOM4N7IG12w33Ak/3zwj1vE8F0d7+5Zl/zLMEsvv9IJ/IhlUruLa\n/vqfv6/mLPndOPJ7EHD6G27bot7/ZhT4IJ4xkOzXoeGAj8zLv0j30ZsxK2QkidYD\nYfoaD893AgMBAAECggEAPe2AvE7I3QduSMlV8COZ6zF0/dVsSmFMdym8B9flm5xt\nlTbl2qYER6+LpJvWXYZU3BMa48oA4Zg8Yfx8kDNCBmJTeAcyNkKFfWX8+57oOMD+\nVG6HxHRmMI31LF4FrYDJeT2I1+SuDL+M1P9526WJRQFsPt7dBv13Tu6e0lf+AKYQ\nuUhPANSLgMDi0r8yfCs07ErbblwncivrQ0w5pX6/0M6Yapdwuc0VqUDVQnzZ8/0C\nNhOR7CwFOq6DPo/lzL3Z7eRYEAtlbiNRCuUm9ktLope0M5E50yKqWsHk/+wZPMOV\nmvB/xzuaa92E4fN2aDY27yJdAmYzPa+Doa9p1kBdeQKBgQDuWaC31X7KdDHuIip9\nBwwTlFDb3c7/+r6O8WlvMJFKM3YSqAccJkc7DkZn2WcQ+4mur0LsXm2tSguuQHMp\nQmO9oVny6PmDbgqHRn6CHONhCGKt643Odd0G7DzY+KT3dX8790Gk/QeZFmEQAfCt\nvurYAqWgIcIfavKX+WCnZxW8OQKBgQC6zRIJmzeeDQno22vcSDPyl3l/pXcCKcNm\nTvE2q1GI4hTuAcQWcwYnVULR4S9A5I60yfJkWBv/UtWxn3cRnxoU0h///ZfvfCTh\nLOf3l85Fr3P2N9/cNaQKxupl1prqrBfN94dOeF4mw/2wC9FjptNdUoQIesgjlxBp\nmxrUOZZJLwKBgFWY+o8KrS4n7IaI3ploHn4plaBgWCa19hl/uU2lM4hiUtUAYw1I\n8evThJVnDgybSSbi6jXY86p4HRnHK5R1szw25gbGhFUe/8j1GBnCJiaCzG2JWrP6\nwBXsYS3KnfQAzmDKu1h1RnVEBDererPrDIvm53RKq1x9HAJYHM4Bx1yBAoGABSLi\nXhVAgD4HibmOy63Ij+EOXC4miY6war288C3hvgvJW4n85EkhYC99+NtiOzyNl/b9\njTjG/ExAx/OEiJ2BUBU/AADvDoyxTue3MR2hdFUQsTJ0G0/2RL2XcFloRQ+aT/WA\naO3yWMqGzTJl/YF2ylgcfUcy/ZeHwf+byz4SHc0CgYB5icg7xfjeFym+1by3FgRS\npzExn2JEdLMqApmFi1Gy9DzpTWaugrtyT/5dP3JV1F5BlwXtJ2o08RiYjCpsBo+q\nxx9VMbLC7SIg0vq3I57xpL8l8EDR10kGvMIaAPcs9BfGNW3tJoXOVreqv4JW4zuQ\nyYjM6VugA3I1G0W3MxXPOA==\n-----END PRIVATE KEY-----\n
```

**⚠️ IMPORTANT**: Copy the entire private key from your `service-account-key.json` file, including the BEGIN/END lines, and replace actual newlines with `\n`

## 🚀 **STEP 3: DEPLOY AND TEST**

### **Deployment Process:**
1. Click "Create Web Service" after setting environment variables
2. Render will automatically build and deploy (2-3 minutes)
3. Watch the build logs for any errors
4. Wait for "Live" status

### **Your Render URL will be:**
```
https://pharmacy-compliance-backend.onrender.com
```

### **Test Endpoints:**
```
Status: https://pharmacy-compliance-backend.onrender.com/status
Test Upload: https://pharmacy-compliance-backend.onrender.com/test-upload
```

## 📱 **STEP 4: UPDATE FRONTEND (ALREADY DONE)**

The frontend is already configured to use:
```javascript
BACKEND_URL: 'https://pharmacy-compliance-backend.onrender.com'
```

## 🧪 **STEP 5: TEST COMPLETE INTEGRATION**

### **Test Sequence:**
1. Visit: https://labreporttool.xyz
2. Check status should show: "Google Drive Connected (Service Account)"
3. Login with: `admin` / `pharmacy123`
4. Record some test data
5. Generate report - should upload automatically
6. Check `labreporting1177@gmail.com` Google Drive for the PDF

## 🔧 **TROUBLESHOOTING**

### **Build Failures:**
- Check requirements.txt is present
- Verify Python version compatibility
- Review build logs in Render dashboard

### **Environment Variable Issues:**
- Double-check all variable names (case-sensitive)
- Ensure private key includes BEGIN/END lines
- Verify no extra spaces in values

### **Google Drive Connection Fails:**
- Verify service account credentials are correct
- Check that folder `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc` is shared with service account
- Test with `/test-upload` endpoint first

### **Service Won't Start:**
- Check start command: `python BACKEND_SERVICE_ACCOUNT.py`
- Verify PORT environment variable is set to 10000
- Review application logs in Render dashboard

## ✅ **SUCCESS INDICATORS**

You'll know it worked when:
- ✅ Build completes without errors
- ✅ Service shows "Live" in Render dashboard  
- ✅ Status endpoint returns JSON with service info
- ✅ Test upload creates file in Google Drive
- ✅ Frontend shows "Google Drive Connected (Service Account)"
- ✅ PDF reports upload automatically to `labreporting1177@gmail.com`

## 💰 **RENDER COSTS**

### **Free Tier (Recommended):**
- $0/month
- 750 hours/month runtime
- Sleeps after 15 minutes inactivity
- Perfect for pharmacy compliance use

### **Starter Tier ($7/month):**
- Always-on service
- Faster response times
- Only needed for high-frequency use

## 🎉 **FINAL RESULT**

After successful deployment:
- 🚀 Professional cloud backend on Render
- 📁 Automatic Google Drive uploads
- 💰 Cost-effective hosting
- 🔒 Secure credential management
- 📊 24/7 pharmacy compliance system

**Your pharmacy application will be running professionally in the cloud! 🚀**