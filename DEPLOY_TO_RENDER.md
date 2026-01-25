# 🚀 Deploy Backend to Render - Complete Guide

## 🎯 **WHY RENDER?**

Render is perfect for your pharmacy compliance backend because:
- ✅ **Free tier available** - $0/month for basic usage
- ✅ **Automatic deployments** - Deploy from GitHub automatically
- ✅ **HTTPS by default** - Secure connections included
- ✅ **Simple setup** - Much easier than Google Cloud
- ✅ **24/7 uptime** - Professional hosting
- ✅ **Auto-scaling** - Handles traffic automatically

## 🚀 **DEPLOYMENT PROCESS**

### **Step 1: Prepare Files for Render**

#### **Create render.yaml (Render Configuration)**
```yaml
services:
  - type: web
    name: pharmacy-compliance-backend
    env: python
    buildCommand: pip install -r requirements.txt
    startCommand: python BACKEND_SERVICE_ACCOUNT.py
    envVars:
      - key: PORT
        value: 10000
      - key: TARGET_EMAIL
        value: labreporting1177@gmail.com
      - key: TARGET_FOLDER_ID
        value: 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
      - key: SERVICE_ACCOUNT_EMAIL
        value: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
```

#### **Update requirements.txt for Render**
```
flask==2.3.3
flask-cors==4.0.0
google-auth==2.23.4
google-auth-oauthlib==1.1.0
google-auth-httplib2==0.1.1
google-api-python-client==2.108.0
gunicorn==21.2.0
```

### **Step 2: Modify Backend for Render**

#### **Environment Variable Support:**
The backend needs to work with Render's environment variables for security.

#### **Port Configuration:**
Render uses port 10000 by default, but we'll make it flexible.

### **Step 3: Deploy to Render**

#### **Option A: GitHub Integration (Recommended)**
1. **Push code to GitHub** (using existing repository)
2. **Go to**: https://render.com/
3. **Sign up/Login** with GitHub account
4. **Create New Web Service**
5. **Connect GitHub repository**: `Jared-T-Proctor-JTP34/LabReport`
6. **Configure deployment settings**

#### **Option B: Direct Upload**
1. **Zip your project files**
2. **Upload to Render dashboard**
3. **Configure settings manually**

## 🔧 **RENDER CONFIGURATION**

### **Service Settings:**
```
Name: pharmacy-compliance-backend
Environment: Python 3
Build Command: pip install -r requirements.txt
Start Command: python BACKEND_SERVICE_ACCOUNT.py
```

### **Environment Variables (Critical):**
```
PORT=10000
TARGET_EMAIL=labreporting1177@gmail.com
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com

# Service Account Credentials (from your JSON file)
GOOGLE_PROJECT_ID=lap-reports
GOOGLE_PRIVATE_KEY_ID=087526c4e652380e51c861225f3af762f62d4310
GOOGLE_PRIVATE_KEY=-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCt7A1Wg0u10kG/...
GOOGLE_CLIENT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
GOOGLE_CLIENT_ID=113380403214174229428
```

## 🔒 **SECURITY: Environment Variables**

### **Why Use Environment Variables?**
- ✅ **Secure** - Credentials not in code
- ✅ **Best practice** - Industry standard
- ✅ **Flexible** - Easy to update without code changes
- ✅ **Safe** - No accidental commits of secrets

### **How to Set in Render:**
1. **Go to**: Service Dashboard
2. **Click**: "Environment" tab
3. **Add**: Each variable from your service account JSON
4. **Save**: Changes trigger automatic redeploy

## 💰 **RENDER PRICING**

### **Free Tier:**
- ✅ **$0/month** for basic web services
- ✅ **750 hours/month** of runtime
- ✅ **Automatic sleep** after 15 minutes of inactivity
- ✅ **HTTPS included**
- ✅ **Custom domains** supported

### **Paid Tier ($7/month):**
- ✅ **Always on** - No sleeping
- ✅ **Faster builds**
- ✅ **More resources**
- ✅ **Priority support**

### **For Pharmacy Use:**
- **Free tier is perfect** for most pharmacy compliance needs
- **Upgrade only if** you need 24/7 instant response

## 🌐 **EXPECTED RENDER URL**

After deployment, your backend will be available at:
```
https://pharmacy-compliance-backend.onrender.com
```

### **Endpoints:**
- **Status**: https://pharmacy-compliance-backend.onrender.com/status
- **Upload**: https://pharmacy-compliance-backend.onrender.com/upload
- **Test**: https://pharmacy-compliance-backend.onrender.com/test-upload

## 📋 **DEPLOYMENT CHECKLIST**

### **Pre-deployment:**
- [ ] Create render.yaml configuration
- [ ] Update requirements.txt
- [ ] Modify backend for environment variables
- [ ] Push code to GitHub repository
- [ ] Prepare service account credentials

### **Render Setup:**
- [ ] Create Render account
- [ ] Connect GitHub repository
- [ ] Configure service settings
- [ ] Set environment variables
- [ ] Deploy service

### **Post-deployment:**
- [ ] Test backend endpoints
- [ ] Verify Google Drive integration
- [ ] Update frontend with Render URL
- [ ] Deploy updated frontend
- [ ] Test complete application

## 🔄 **AUTOMATIC DEPLOYMENTS**

### **GitHub Integration Benefits:**
- ✅ **Auto-deploy** on git push
- ✅ **Branch protection** - deploy from main branch only
- ✅ **Build logs** - See deployment progress
- ✅ **Rollback** - Easy to revert if needed

### **Deployment Trigger:**
```bash
# Any push to main branch triggers deployment
git add .
git commit -m "Update backend for production"
git push origin main
# Render automatically deploys within 2-3 minutes
```

## 🧪 **TESTING ON RENDER**

### **Health Check Endpoints:**
```bash
# Test basic connectivity
curl https://pharmacy-compliance-backend.onrender.com/status

# Test Google Drive integration
curl -X POST https://pharmacy-compliance-backend.onrender.com/test-upload
```

### **Expected Response:**
```json
{
  "status": "running",
  "service": "Google Drive Backend with Service Account",
  "target_email": "labreporting1177@gmail.com",
  "drive_service_ready": true,
  "timestamp": "2026-01-25T..."
}
```

## 🔧 **TROUBLESHOOTING**

### **Common Issues:**

#### **1. Build Failures**
- Check requirements.txt syntax
- Verify Python version compatibility
- Review build logs in Render dashboard

#### **2. Environment Variable Issues**
- Ensure all variables are set correctly
- Check for typos in variable names
- Verify private key format (newlines as \\n)

#### **3. Google Drive Connection Fails**
- Verify service account credentials
- Check folder sharing permissions
- Test with local backend first

#### **4. Service Won't Start**
- Check start command syntax
- Verify port configuration
- Review application logs

## 🎯 **SUCCESS INDICATORS**

You'll know deployment worked when:
- ✅ **Build completes** without errors
- ✅ **Service shows "Live"** in Render dashboard
- ✅ **Status endpoint** returns valid JSON
- ✅ **Google Drive test** uploads file successfully
- ✅ **Frontend connects** to Render backend
- ✅ **PDF reports upload** to labreporting1177@gmail.com

## 🚀 **NEXT STEPS AFTER RENDER DEPLOYMENT**

1. **Get Render URL** from dashboard
2. **Update frontend** configuration
3. **Test integration** end-to-end
4. **Deploy to GitHub Pages**
5. **Verify production functionality**

## 📞 **RENDER SUPPORT**

### **Resources:**
- **Documentation**: https://render.com/docs
- **Community**: https://community.render.com/
- **Status**: https://status.render.com/
- **Support**: Available through dashboard

**Render provides excellent documentation and community support for any deployment issues! 🚀**