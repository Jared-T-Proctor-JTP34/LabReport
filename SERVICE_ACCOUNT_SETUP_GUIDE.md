# 🔐 Service Account Setup Guide - Automatic Google Drive for labreporting1177@gmail.com

## 🎯 **OBJECTIVE**
Set up automatic Google Drive authentication for `labreporting1177@gmail.com` using a service account, eliminating the need for manual OAuth consent.

## 🚀 **STEP-BY-STEP SETUP**

### **Step 1: Create Service Account in Google Cloud Console**

1. **Go to**: https://console.cloud.google.com/iam-admin/serviceaccounts
2. **Click**: "Create Service Account"
3. **Fill in details**:
   ```
   Service account name: Pharmacy Compliance Reports
   Service account ID: pharmacy-compliance-reports
   Description: Automated Google Drive uploads for pharmacy compliance reports to labreporting1177@gmail.com
   ```
4. **Click**: "Create and Continue"
5. **Skip roles** (click "Continue")
6. **Click**: "Done"

### **Step 2: Generate Service Account Key**

1. **Click** on the newly created service account
2. **Go to**: "Keys" tab
3. **Click**: "Add Key" → "Create new key"
4. **Select**: "JSON" format
5. **Click**: "Create"
6. **Download** the JSON file
7. **Rename** the file to: `service-account-key.json`
8. **Keep secure** - this file contains authentication credentials

### **Step 3: Share Google Drive Folder with Service Account**

1. **Login** to Google Drive with `labreporting1177@gmail.com`
2. **Navigate** to your target folder (ID: `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`)
3. **Right-click** on the folder → "Share"
4. **Add** the service account email:
   - **Format**: `pharmacy-compliance-reports@[your-project-id].iam.gserviceaccount.com`
   - **Find this email** in the downloaded JSON file under `"client_email"`
5. **Set permission**: "Editor" (allows read/write access)
6. **Click**: "Share"
7. **Confirm** sharing (no notification needed)

### **Step 4: Install Backend Service**

1. **Place** `service-account-key.json` in your project directory
2. **Install** required Python packages:
   ```bash
   pip install flask flask-cors google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
   ```
3. **Run** the backend service:
   ```bash
   python BACKEND_SERVICE_ACCOUNT.py
   ```

### **Step 5: Test Service Account Setup**

1. **Visit**: http://localhost:8001/status
2. **Check**: Service status and folder access
3. **Test upload**: http://localhost:8001/test-upload
4. **Verify**: File appears in `labreporting1177@gmail.com` Google Drive

## 🔧 **UPDATE FRONTEND APPLICATION**

### **Remove OAuth Prompts**
Update the frontend to use backend-only uploads without user authentication:

```javascript
// Updated configuration for service account backend
const CONFIG = {
  // Remove Google API keys (not needed for service account)
  BACKEND_URL: isDevelopment ? 'http://localhost:8001' : 'https://pharmacy-compliance-backend.onrender.com',
  
  // Service account handles authentication
  USE_SERVICE_ACCOUNT: true,
  TARGET_EMAIL: 'labreporting1177@gmail.com',
  
  // Keep other settings
  CREDENTIALS: {
    "admin": "pharmacy123",
    "pharmacist": "compound456", 
    "tech": "sterile789"
  }
};
```

### **Simplified Upload Function**
```javascript
async function uploadToBackend(fileName, content, contentType = 'application/pdf') {
  try {
    let fileContent = content;
    let encoding = 'text';
    
    if (content instanceof Blob) {
      const arrayBuffer = await content.arrayBuffer();
      fileContent = btoa(String.fromCharCode.apply(null, new Uint8Array(arrayBuffer)));
      encoding = 'base64';
    }
    
    const response = await fetch(`${CONFIG.BACKEND_URL}/upload`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        filename: fileName,
        content: fileContent,
        content_type: contentType,
        encoding: encoding
      })
    });
    
    if (response.ok) {
      const result = await response.json();
      console.log('✅ File uploaded to labreporting1177@gmail.com Google Drive');
      updateSystemStatus('connected', 'Google Drive Connected', 
        `Files automatically uploaded to ${CONFIG.TARGET_EMAIL} Google Drive`);
      return true;
    }
    
    throw new Error('Backend upload failed');
  } catch (error) {
    console.error('❌ Upload error:', error);
    // Fallback to local download
    downloadFile(fileName, content);
    return false;
  }
}
```

## 📋 **CONFIGURATION CHECKLIST**

### **Google Cloud Console:**
- [ ] Service account created with proper name
- [ ] JSON key file downloaded and renamed
- [ ] Service account email noted for sharing

### **Google Drive (labreporting1177@gmail.com):**
- [ ] Target folder accessible
- [ ] Folder shared with service account email
- [ ] Service account has "Editor" permissions

### **Backend Service:**
- [ ] `service-account-key.json` placed in project directory
- [ ] Python dependencies installed
- [ ] Backend service running on port 8001
- [ ] Status endpoint returns success
- [ ] Test upload creates file in Google Drive

### **Frontend Application:**
- [ ] OAuth prompts removed
- [ ] Backend URL configured correctly
- [ ] Upload function uses backend service
- [ ] Status shows automatic Google Drive connection

## 🎯 **EXPECTED BEHAVIOR**

### **After Complete Setup:**
1. **No OAuth prompts** - Users never see Google authentication screens
2. **Automatic uploads** - All PDF reports go directly to `labreporting1177@gmail.com` Google Drive
3. **Seamless experience** - Users just see "Google Drive Connected" status
4. **Reliable operation** - No token expiration or authentication issues
5. **Organized storage** - Files appear in the specified folder automatically

### **User Experience:**
1. **Login** to application with pharmacy credentials
2. **Record data** (temperature, humidity, etc.)
3. **Generate report** - PDF automatically uploads to Google Drive
4. **Success message** - "Report uploaded to Google Drive"
5. **No Google prompts** - Everything happens in the background

## 🚨 **SECURITY NOTES**

### **Service Account Key Security:**
- ✅ **Never commit** `service-account-key.json` to version control
- ✅ **Add to .gitignore**: `service-account-key.json`
- ✅ **Secure storage** on production servers
- ✅ **Regular rotation** of service account keys
- ✅ **Minimum permissions** - only Drive file access

### **Access Control:**
- ✅ **Folder-level sharing** only (not entire Drive)
- ✅ **Editor permissions** (read/write to shared folder)
- ✅ **Monitor usage** through Google Cloud Console
- ✅ **Audit logs** enabled for security tracking

## 🔄 **DEPLOYMENT STEPS**

### **For Production:**
1. **Create production service account** (separate from development)
2. **Generate production JSON key**
3. **Share production folder** with production service account
4. **Deploy backend** with production credentials
5. **Update frontend** to use production backend URL
6. **Test complete flow** with production setup

### **Environment Variables (Production):**
```bash
# Instead of JSON file, use environment variables
GOOGLE_SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@project.iam.gserviceaccount.com
GOOGLE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n"
GOOGLE_PROJECT_ID=your-project-id
TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
TARGET_EMAIL=labreporting1177@gmail.com
```

## 🚀 **IMMEDIATE NEXT STEPS**

1. **Create service account** in Google Cloud Console
2. **Download JSON key** and rename to `service-account-key.json`
3. **Share Google Drive folder** with service account email
4. **Run backend service** with `python BACKEND_SERVICE_ACCOUNT.py`
5. **Test upload** at http://localhost:8001/test-upload
6. **Update frontend** to remove OAuth and use backend-only uploads

**This setup will provide seamless, automatic Google Drive uploads to `labreporting1177@gmail.com` without any user authentication prompts! 🔐✅**