# ✅ Complete Service Account Setup - pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com

## 🎯 **SERVICE ACCOUNT READY**
Your service account `pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com` is created and ready for configuration.

## 🚀 **IMMEDIATE NEXT STEPS**

### **Step 1: Share Google Drive Folder (2 minutes)**

1. **Login** to Google Drive with `labreporting1177@gmail.com`
2. **Navigate** to the target folder:
   - **Folder ID**: `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`
   - **URL**: `https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`
3. **Right-click** on the folder → **"Share"**
4. **Add** the service account email:
   ```
   pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
   ```
5. **Set permission**: **"Editor"** (allows read/write access)
6. **Click**: **"Share"**
7. **No notification needed** - service accounts don't receive emails

### **Step 2: Download and Place Service Account Key**

1. **Go to**: https://console.cloud.google.com/iam-admin/serviceaccounts
2. **Find**: `pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com`
3. **Click** on the service account
4. **Go to**: **"Keys"** tab
5. **Click**: **"Add Key"** → **"Create new key"**
6. **Select**: **"JSON"** format
7. **Click**: **"Create"**
8. **Download** the JSON file
9. **Rename** to: `service-account-key.json`
10. **Place** in your project directory (same folder as `BACKEND_SERVICE_ACCOUNT.py`)

### **Step 3: Install Backend Dependencies**

```bash
# Install required Python packages
pip install flask flask-cors google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
```

### **Step 4: Test Backend Service**

```bash
# Run the backend service
python BACKEND_SERVICE_ACCOUNT.py
```

**Expected output:**
```
🚀 Starting Google Drive Backend with Service Account
📧 Target email: labreporting1177@gmail.com
📁 Target folder: 1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
🔑 Service account file: service-account-key.json

✅ Google Drive service initialized
📧 Service account: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
✅ Folder access confirmed: [folder-name]
✅ Service account has folder permissions

✅ Google Drive service ready for automatic uploads

🌐 Backend running at: http://localhost:8001
📊 Status endpoint: http://localhost:8001/status
🧪 Test upload: http://localhost:8001/test-upload
```

### **Step 5: Test Upload Functionality**

1. **Visit**: http://localhost:8001/status
   - Should show service ready and folder access confirmed

2. **Test upload**: http://localhost:8001/test-upload
   - Should create a test file in `labreporting1177@gmail.com` Google Drive

3. **Verify in Google Drive**:
   - Login to `labreporting1177@gmail.com`
   - Check the target folder for test file

## 🔧 **UPDATE FRONTEND APPLICATION**

### **Remove Google OAuth and Use Backend-Only Uploads**

<function_calls>
<invoke name="strReplace">
<parameter name="newStr">// Configuration
const CONFIG = {
  // Dynamic backend URL based on environment
  BACKEND_URL: isDevelopment ? 'http://localhost:8001' : 'https://api.labreporttool.xyz',
  
  // Service Account Configuration (no frontend Google API needed)
  USE_SERVICE_ACCOUNT: true,
  TARGET_EMAIL: 'labreporting1177@gmail.com',
  SERVICE_ACCOUNT_EMAIL: 'pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com',
  TARGET_FOLDER_ID: '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc',
  
  // Environment info
  ENVIRONMENT: isDevelopment ? 'development' : 'production',