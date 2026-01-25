# 🔧 Google Cloud Console Setup - COMPLETE GUIDE

## 🚨 **CRITICAL: OAuth Consent Screen Required**

The error `idpiframe_initialization_failed` means your Google Cloud Console project needs an **OAuth consent screen** configured. This is MANDATORY for new applications using Google Identity Services.

## 🛠️ **Complete Setup Process:**

### **Step 1: Configure OAuth Consent Screen (REQUIRED)**

1. **Go to Google Cloud Console**: https://console.cloud.google.com/
2. **Navigate to**: APIs & Services → **OAuth consent screen**
   - **Alternative**: Use this direct link: https://console.cloud.google.com/apis/credentials/consent
3. **Choose User Type**: 
   - Select **"External"** (for public use)
   - Click **"Create"**

4. **Fill Required Fields**:
   ```
   App name: Pharmacy Compounding Compliance Log
   User support email: [your email address]
   Developer contact information: [your email address]
   
   App description: Professional USP compliance monitoring system for pharmacy compounding operations. Tracks temperature, humidity, air pressure, and cleaning tasks for USP 795, 797, and 800 areas. Generates PDF compliance reports and uploads them to Google Drive for secure regulatory documentation. No personal health information is collected.
   
   App domain: labreporttool.xyz
   Privacy Policy URL: https://labreporttool.xyz (optional)
   Terms of Service URL: https://labreporttool.xyz (optional)
   ```

5. **Add Authorized Domains**:
   ```
   labreporttool.xyz
   github.io
   ```

6. **Click "Save and Continue"** through all steps
7. **Publish the app** (click "Publish App" button)

### **Step 2: Configure OAuth 2.0 Client ID**

1. **Navigate to**: APIs & Services → **Credentials**
2. **Find your OAuth Client ID**: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
3. **Click the pencil icon** to edit

4. **Add Authorized JavaScript Origins**:
   ```
   https://labreporttool.xyz
   https://www.labreporttool.xyz
   https://jared-t-proctor-jtp34.github.io
   ```

5. **Add Authorized Redirect URIs**:
   ```
   https://labreporttool.xyz
   https://www.labreporttool.xyz
   https://jared-t-proctor-jtp34.github.io/LabReport/
   ```

6. **Click "Save"**

### **Step 3: Configure API Key (Optional but Recommended)**

1. **Find your API Key**: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`
2. **Click the pencil icon** to edit
3. **Under "Website restrictions"**, add:
   ```
   https://labreporttool.xyz/*
   https://www.labreporttool.xyz/*
   https://jared-t-proctor-jtp34.github.io/*
   ```
4. **Click "Save"**

### **Step 4: Enable Required APIs**

1. **Navigate to**: APIs & Services → **Library**
2. **Search and Enable**:
   - ✅ Google Drive API
   - ✅ Google Identity Services API (should be enabled by default)

## 🧪 **Test After Configuration**

### **Wait for Propagation**
- **Wait 5-10 minutes** after saving changes
- Google's systems need time to update

### **Clear Cache and Test**
1. **Clear browser cache**: `Ctrl + F5`
2. **Visit**: https://labreporttool.xyz
3. **Check console** - should see:
   ```
   🌐 GitHub Pages detected - skipping backend check
   � Initializing Google Identity Services for GitHub Pages...
   ✅ Google Identity Services loaded successfully
   ⚠️ Google Drive authentication required
   ```

### **Test Authentication**
1. **Click status symbol** (⚠️)
2. **Should see**: Google consent screen with your app name
3. **Grant permissions**: Allow access to Google Drive
4. **Should see**: ✅ "Google Drive Connected"

## 📋 **OAuth Consent Screen Details**

### **Required Information**:
```
App name: Pharmacy Compounding Compliance Log
User support email: [your email]
Developer contact information: [your email]
App domain: labreporttool.xyz
Privacy Policy URL: https://labreporttool.xyz (optional)
Terms of Service URL: https://labreporttool.xyz (optional)
```

### **Scopes** (should be automatically added):
- `https://www.googleapis.com/auth/drive.file` - Upload files to Google Drive

### **Test Users** (if app is in testing mode):
- Add your own email address as a test user

## 🚨 **Common Issues & Solutions**

### **"App not verified" warning**
- **Normal for new apps** - users can click "Advanced" → "Go to [app name] (unsafe)"
- **To remove warning**: Submit app for verification (optional for personal use)

### **"Access blocked" error**
- **Cause**: OAuth consent screen not published
- **Solution**: Go back to OAuth consent screen and click "Publish App"

### **"Invalid client" error**
- **Cause**: Authorized domains not configured correctly
- **Solution**: Double-check the exact URLs in the authorized origins

## 🎯 **Expected Flow After Setup**

1. **User visits**: https://labreporttool.xyz
2. **Clicks authenticate**: Status symbol (⚠️)
3. **Sees consent screen**: "Pharmacy Compounding Compliance Log wants to access your Google Drive"
4. **Grants permission**: Click "Allow"
5. **Authentication success**: ✅ "Google Drive Connected"
6. **File uploads work**: PDFs automatically upload to Google Drive

## 📞 **Verification Checklist**

- [ ] OAuth consent screen configured and published
- [ ] App name and contact information filled
- [ ] Authorized domains added to consent screen
- [ ] OAuth Client ID configured with authorized origins
- [ ] API Key configured with website restrictions (optional)
- [ ] Google Drive API enabled
- [ ] Waited 5-10 minutes for changes to propagate
- [ ] Browser cache cleared
- [ ] Tested authentication flow

## 🚀 **After Successful Setup**

Your pharmacy compliance application will:
- ✅ Load without deprecated API errors
- ✅ Show proper Google consent screen
- ✅ Successfully authenticate users
- ✅ Upload PDF reports to Google Drive automatically
- ✅ Work professionally at labreporttool.xyz

**The OAuth consent screen is the missing piece!** Once configured, everything should work perfectly. 🎯