# Google Drive Connectivity Test & Setup Guide

## 🔍 Current Configuration Status

### ✅ **Configured:**
- **Google Client ID:** `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
- **Target Folder ID:** `1k_LobI2ggS0rs83VevymeA0D-RHOTYSD`
- **OAuth2 Scopes:** `https://www.googleapis.com/auth/drive.file`

### ❌ **Missing:**
- **Google API Key:** Empty (required for Google Drive API access)

## 🚨 What You Need to Complete Setup

### Step 1: Get Your Google API Key
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project (the one with Client ID: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2`)
3. Go to **APIs & Services** → **Credentials**
4. Click **Create Credentials** → **API Key**
5. Copy the generated API Key
6. **Restrict the API Key:**
   - Click on the API Key you just created
   - Under "API restrictions", select "Restrict key"
   - Choose "Google Drive API"
   - Save

### Step 2: Configure Authorized Domains
In your OAuth2 Client ID settings:
1. Go to **APIs & Services** → **Credentials**
2. Click on your OAuth2 Client ID
3. Add these to **Authorized JavaScript origins:**
   - `https://labreporttool.xyz`
   - `https://www.labreporttool.xyz`
   - `https://jared-t-proctor-jtp34.github.io` (for testing)
4. Add these to **Authorized redirect URIs:**
   - `https://labreporttool.xyz`
   - `https://www.labreporttool.xyz`
   - `https://jared-t-proctor-jtp34.github.io/LabReport/`

### Step 3: Update Your HTML File
Replace this line in `Pharmacy_Compliance_GoogleDrive.html`:
```javascript
const GOOGLE_API_KEY = ''; // Set this to your Google Cloud Console API Key
```
With:
```javascript
const GOOGLE_API_KEY = 'YOUR_API_KEY_HERE'; // Replace with your actual API Key
```

## 🧪 How to Test Connectivity

### Test 1: Load the Application
1. Open your application: `https://labreporttool.xyz`
2. Click "Launch Application"
3. Login with credentials
4. Check the **Google Drive Status** section

### Expected Results:
- **Before API Key:** "Google Drive Not Configured"
- **After API Key:** "Google Drive API Ready"

### Test 2: Connect to Google Drive
1. Click **"Connect Google Drive"** button
2. You should see Google OAuth2 popup
3. Grant permissions to access Google Drive
4. Status should change to: **"Connected to Google Drive"**

### Test 3: Upload Test
1. Enter some test data in any compounding area
2. Click **"Get Report"**
3. Check if file uploads to your Google Drive folder

## 🔍 Troubleshooting Guide

### Issue: "Google Drive Not Configured"
**Cause:** Missing API Key
**Solution:** Add your Google API Key to the HTML file

### Issue: "Authentication Failed"
**Cause:** Domain not authorized
**Solution:** Add your domain to OAuth2 authorized origins

### Issue: "Failed to initialize Google API client"
**Cause:** API Key restrictions or invalid key
**Solution:** Check API Key restrictions in Google Cloud Console

### Issue: "Upload failed"
**Cause:** Insufficient permissions or folder access
**Solution:** Verify folder ID and permissions

## 📁 Google Drive Folder Verification

Your target folder ID: `1k_LobI2ggS0rs83VevymeA0D-RHOTYSD`

To verify this folder:
1. Go to: `https://drive.google.com/drive/folders/1k_LobI2ggS0rs83VevymeA0D-RHOTYSD`
2. Make sure you have write access to this folder
3. The application will upload PDF reports here

## 🔧 Quick Test Commands

### Test Google APIs Loading:
Open browser console on your application and run:
```javascript
console.log('GAPI loaded:', typeof gapi !== 'undefined');
console.log('Google Identity loaded:', typeof google !== 'undefined');
console.log('Client ID configured:', GOOGLE_CLIENT_ID !== '');
console.log('API Key configured:', GOOGLE_API_KEY !== '');
```

### Test Drive Status:
```javascript
console.log('Drive status element:', document.getElementById('driveStatus'));
console.log('Current status:', document.getElementById('driveStatusText').textContent);
```

## 📞 Support Resources

- **Google Cloud Console:** https://console.cloud.google.com/
- **Google Drive API Docs:** https://developers.google.com/drive/api/v3/quickstart/js
- **OAuth2 Setup Guide:** https://developers.google.com/identity/oauth2/web/guides/overview

## ✅ Success Checklist

- [ ] Google API Key added to HTML file
- [ ] Domain authorized in OAuth2 settings
- [ ] Google Drive API enabled in Cloud Console
- [ ] Application shows "Google Drive API Ready"
- [ ] "Connect Google Drive" button works
- [ ] Authentication popup appears
- [ ] Status changes to "Connected to Google Drive"
- [ ] Test upload succeeds
- [ ] Files appear in target Google Drive folder

---

**Next Step:** Get your Google API Key and update the HTML file!