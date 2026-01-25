# ☁️ Deploy Backend to Google Cloud Services

## 🎯 **OBJECTIVE**
Deploy the pharmacy compliance backend to Google Cloud for 24/7 availability, eliminating the need to run it locally.

## 🚀 **RECOMMENDED: Google Cloud Run**

Google Cloud Run is perfect for this application because it:
- ✅ **Serverless** - No server management required
- ✅ **Auto-scaling** - Scales to zero when not in use (cost-effective)
- ✅ **HTTPS by default** - Secure connections
- ✅ **Easy deployment** - Deploy directly from code
- ✅ **Pay per use** - Only pay when requests are made

## 📋 **DEPLOYMENT STEPS**

### **Step 1: Prepare for Cloud Deployment**

#### **Create Dockerfile:**
```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use environment variables for service account
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/service-account-key.json

EXPOSE 8080

CMD ["python", "BACKEND_SERVICE_ACCOUNT.py"]
```

#### **Create requirements.txt:**
```
flask==2.3.3
flask-cors==4.0.0
google-auth==2.23.4
google-auth-oauthlib==1.1.0
google-auth-httplib2==0.1.1
google-api-python-client==2.108.0
gunicorn==21.2.0
```

### **Step 2: Modify Backend for Cloud Run**

#### **Update Port Configuration:**
```python
# At the end of BACKEND_SERVICE_ACCOUNT.py
if __name__ == "__main__":
    import os
    port = int(os.environ.get('PORT', 8001))
    app.run(host='0.0.0.0', port=port, debug=False)
```

### **Step 3: Deploy to Google Cloud Run**

#### **Option A: Using Google Cloud Console (Easiest)**
1. **Go to**: https://console.cloud.google.com/run
2. **Click**: "Create Service"
3. **Choose**: "Deploy one revision from an existing container image"
4. **Or**: "Continuously deploy new revisions from a source repository"

#### **Option B: Using gcloud CLI**
```bash
# Install Google Cloud CLI
# https://cloud.google.com/sdk/docs/install

# Authenticate
gcloud auth login

# Set project
gcloud config set project lap-reports

# Deploy to Cloud Run
gcloud run deploy pharmacy-backend \
    --source . \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --port 8080
```

## 🔧 **CONFIGURATION FOR CLOUD DEPLOYMENT**

### **Environment Variables (Secure Method)**
Instead of including the JSON file, use environment variables:

```python
import os
import json
from google.oauth2 import service_account

# Load service account from environment variables
def get_credentials():
    if os.path.exists('service-account-key.json'):
        # Local development
        return service_account.Credentials.from_service_account_file(
            'service-account-key.json',
            scopes=CONFIG['SCOPES']
        )
    else:
        # Cloud deployment - use environment variables
        service_account_info = {
            "type": "service_account",
            "project_id": os.environ.get('GOOGLE_PROJECT_ID'),
            "private_key_id": os.environ.get('GOOGLE_PRIVATE_KEY_ID'),
            "private_key": os.environ.get('GOOGLE_PRIVATE_KEY').replace('\\n', '\n'),
            "client_email": os.environ.get('GOOGLE_CLIENT_EMAIL'),
            "client_id": os.environ.get('GOOGLE_CLIENT_ID'),
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs"
        }
        
        return service_account.Credentials.from_service_account_info(
            service_account_info,
            scopes=CONFIG['SCOPES']
        )
```

### **Set Environment Variables in Cloud Run:**
```bash
GOOGLE_PROJECT_ID=lap-reports
GOOGLE_PRIVATE_KEY_ID=087526c4e652380e51c861225f3af762f62d4310
GOOGLE_PRIVATE_KEY=-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCt7A1Wg0u10kG/...
GOOGLE_CLIENT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
GOOGLE_CLIENT_ID=113380403214174229428
TARGET_EMAIL=labreporting1177@gmail.com
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
```

## 🌐 **UPDATE FRONTEND FOR CLOUD BACKEND**

### **Update CONFIG in Pharmacy_Compliance_Backend.html:**
```javascript
// Configuration
const CONFIG = {
  // Dynamic backend URL based on environment
  BACKEND_URL: isDevelopment ? 'http://localhost:8001' : 'https://pharmacy-backend-[hash]-uc.a.run.app',
  
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

## 💰 **COST ESTIMATION**

### **Google Cloud Run Pricing:**
- **Free tier**: 2 million requests per month
- **CPU**: $0.00002400 per vCPU-second
- **Memory**: $0.00000250 per GiB-second
- **Requests**: $0.40 per million requests

### **Expected Monthly Cost:**
For a pharmacy compliance application:
- **Estimated requests**: ~1,000-5,000 per month
- **Expected cost**: **$0-5 per month** (likely free tier)

## 🔒 **SECURITY BEST PRACTICES**

### **1. Use Secret Manager (Recommended)**
```bash
# Store service account key in Secret Manager
gcloud secrets create service-account-key --data-file=service-account-key.json

# Grant Cloud Run access to secret
gcloud secrets add-iam-policy-binding service-account-key \
    --member="serviceAccount:pharmacy-backend@lap-reports.iam.gserviceaccount.com" \
    --role="roles/secretmanager.secretAccessor"
```

### **2. Enable CORS for Your Domain**
```python
from flask_cors import CORS

# Configure CORS for your domain
CORS(app, origins=[
    'https://labreporttool.xyz',
    'https://jared-t-proctor-jtp34.github.io'
])
```

### **3. Add Authentication (Optional)**
```python
# Add API key authentication for extra security
@app.before_request
def authenticate_request():
    if request.endpoint in ['upload', 'test_upload']:
        api_key = request.headers.get('X-API-Key')
        if api_key != os.environ.get('API_KEY'):
            return jsonify({'error': 'Unauthorized'}), 401
```

## 📋 **DEPLOYMENT CHECKLIST**

### **Pre-deployment:**
- [ ] Create Dockerfile
- [ ] Create requirements.txt
- [ ] Update backend for Cloud Run port
- [ ] Set up environment variables
- [ ] Test locally with Docker

### **Deployment:**
- [ ] Deploy to Google Cloud Run
- [ ] Configure environment variables
- [ ] Test backend endpoints
- [ ] Update frontend with Cloud Run URL
- [ ] Test complete integration

### **Post-deployment:**
- [ ] Monitor logs and performance
- [ ] Set up alerts for errors
- [ ] Configure custom domain (optional)
- [ ] Set up SSL certificate

## 🚀 **QUICK DEPLOYMENT OPTION**

### **Using Google Cloud Shell (Easiest):**
1. **Go to**: https://console.cloud.google.com/
2. **Open**: Cloud Shell (terminal icon)
3. **Upload**: Your project files
4. **Run**: Deployment commands

### **One-Click Deploy Button:**
You can create a "Deploy to Google Cloud" button for easy deployment.

## 🎯 **EXPECTED RESULT**

After deployment:
- ✅ **Backend URL**: `https://pharmacy-backend-[hash]-uc.a.run.app`
- ✅ **24/7 availability** - No need to run locally
- ✅ **Auto-scaling** - Handles traffic automatically
- ✅ **HTTPS by default** - Secure connections
- ✅ **Cost-effective** - Pay only for usage
- ✅ **Professional setup** - Production-ready

## 📞 **NEXT STEPS**

1. **Choose deployment method** (Cloud Console or gcloud CLI)
2. **Prepare files** (Dockerfile, requirements.txt)
3. **Deploy to Cloud Run**
4. **Update frontend** with Cloud Run URL
5. **Test complete integration**

**Would you like me to create the specific deployment files and walk you through the Cloud Run deployment process? 🚀**