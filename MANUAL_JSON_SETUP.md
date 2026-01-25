# 📁 Manual Service Account JSON Setup Guide

## 🎯 **OBJECTIVE**
Add the downloaded `service-account-key.json` file to your project directory for automatic Google Drive authentication.

## 🚀 **AUTOMATED SETUP (Recommended)**

### **Option 1: Batch Script**
1. **Double-click**: `ADD_SERVICE_ACCOUNT_KEY.bat`
2. **Script will**: Automatically find and copy the JSON file
3. **Verify**: File structure and service account details

### **Option 2: PowerShell Script**
1. **Right-click**: `Add-ServiceAccountKey.ps1` → "Run with PowerShell"
2. **Get**: Detailed progress and JSON validation
3. **Confirm**: Service account email and project details

## 📋 **MANUAL SETUP**

### **Step 1: Locate Downloaded File**
The `service-account-key.json` file is typically in:
- `C:\Users\jared\Downloads\service-account-key.json`
- `C:\Users\jared\OneDrive\Downloads\service-account-key.json`
- Your browser's default download location

### **Step 2: Copy to Project Directory**
1. **Copy** the `service-account-key.json` file
2. **Paste** it into this project directory (same folder as `BACKEND_SERVICE_ACCOUNT.py`)
3. **Ensure** the filename is exactly: `service-account-key.json`

### **Step 3: Verify File Structure**
The JSON file should contain these key fields:
```json
{
  "type": "service_account",
  "project_id": "lap-reports",
  "private_key_id": "...",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com",
  "client_id": "...",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token"
}
```

## 🔍 **VERIFICATION CHECKLIST**

### **File Location:**
- [ ] `service-account-key.json` exists in project directory
- [ ] File is in same folder as `BACKEND_SERVICE_ACCOUNT.py`
- [ ] Filename is exactly `service-account-key.json` (no extra extensions)

### **File Content:**
- [ ] File contains valid JSON structure
- [ ] `"type": "service_account"` is present
- [ ] `"client_email"` shows `pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com`
- [ ] `"project_id"` shows `lap-reports`
- [ ] `"private_key"` contains the full private key

### **Security:**
- [ ] File permissions are secure (not world-readable)
- [ ] File is not committed to version control
- [ ] `.gitignore` includes `service-account-key.json`

## 🚨 **SECURITY NOTES**

### **NEVER Commit to Git:**
The `service-account-key.json` file contains sensitive credentials and should NEVER be committed to version control.

**Add to `.gitignore`:**
```
# Service Account Keys
service-account-key.json
*.json
```

### **File Permissions:**
Ensure the file is only readable by your user account and not accessible to other users on the system.

## 🧪 **TEST SETUP**

### **After Adding JSON File:**

1. **Run Backend Service:**
   ```bash
   python BACKEND_SERVICE_ACCOUNT.py
   ```

2. **Expected Output:**
   ```
   ✅ Google Drive service initialized
   📧 Service account: pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com
   ✅ Folder access confirmed: [folder-name]
   ✅ Service account has folder permissions
   ```

3. **Test Status Endpoint:**
   - Visit: http://localhost:8001/status
   - Should show: `"drive_service_ready": true`

4. **Test Upload:**
   - Visit: http://localhost:8001/test-upload
   - Should create test file in `labreporting1177@gmail.com` Google Drive

## 🚨 **TROUBLESHOOTING**

### **If File Not Found:**
```
❌ Service account file not found: service-account-key.json
```
**Solution:**
- Verify file is in correct directory
- Check filename spelling exactly
- Ensure file was downloaded completely

### **If JSON Invalid:**
```
❌ Failed to initialize Google Drive service: Invalid JSON
```
**Solution:**
- Re-download the JSON file from Google Cloud Console
- Verify file wasn't corrupted during download
- Check file contains complete JSON structure

### **If Permissions Error:**
```
❌ Folder access test failed: 403 Forbidden
```
**Solution:**
- Share Google Drive folder with service account email
- Ensure "Editor" permissions are granted
- Wait a few minutes for permissions to propagate

## 📋 **NEXT STEPS AFTER JSON SETUP**

### **1. Share Google Drive Folder**
- Login to `labreporting1177@gmail.com`
- Share folder `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc` with:
  `pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com`
- Set permission to "Editor"

### **2. Test Backend Service**
- Run `python BACKEND_SERVICE_ACCOUNT.py`
- Verify Google Drive service initializes successfully
- Test upload functionality

### **3. Deploy Updated Frontend**
- Run `SYNC_GITHUB.bat` to push updated code
- Test complete application functionality
- Verify automatic Google Drive uploads work

## ✅ **SUCCESS INDICATORS**

You'll know the JSON file is correctly set up when:
- ✅ Backend service starts without errors
- ✅ Google Drive service initializes successfully
- ✅ Folder access is confirmed
- ✅ Test uploads create files in Google Drive
- ✅ No authentication prompts required

**Use the automated scripts for the easiest setup, or follow the manual steps if you prefer more control over the process! 🔐**