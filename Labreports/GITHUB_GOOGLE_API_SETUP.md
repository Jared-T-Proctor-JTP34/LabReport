# 🔧 GitHub + Google API Setup Guide

## 🎯 **Goal: Make Google Drive Integration Work on GitHub Pages**

The application now supports both local development (with backend service) and GitHub Pages deployment (with direct Google API integration). This guide shows you how to configure everything properly.

## 🚀 **Updated Application Features**

✅ **Environment Detection**: Automatically detects local vs GitHub Pages deployment  
✅ **Dual Integration**: Backend service for local + Direct Google API for GitHub Pages  
✅ **Smart Fallbacks**: Downloads locally if no service available  
✅ **Enhanced Status**: Clear visual indicators for connection status  
✅ **Click Authentication**: Click the status symbol to authenticate on GitHub Pages  

## 🔧 **Required Google Cloud Console Setup**

### **Step 1: Configure Authorized Domains**

1. **Go to Google Cloud Console**: https://console.cloud.google.com/
2. **Navigate to**: APIs & Services → Credentials
3. **Select your OAuth2 Client ID**: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
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

### **Step 2: Enable Required APIs**

1. **Navigate to**: APIs & Services → Library
2. **Enable these APIs**:
   - Google Drive API
   - Google Picker API (optional, for file selection)

### **Step 3: Configure API Key Restrictions**

1. **Go to**: APIs & Services → Credentials
2. **Select your API Key**: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`
3. **Add HTTP Referrers**:
   ```
   https://labreporttool.xyz/*
   https://www.labreporttool.xyz/*
   https://jared-t-proctor-jtp34.github.io/*
   ```

## 🌐 **GitHub Pages Deployment**

### **Automatic Deployment**

The repository now includes GitHub Actions workflow that automatically deploys to GitHub Pages on every push to main branch.

**Deployment URL**: https://jared-t-proctor-jtp34.github.io/LabReport/

### **Custom Domain Setup**

Your custom domain `labreporttool.xyz` should point to GitHub Pages:

1. **DNS A Records** (already configured):
   ```
   185.199.108.153
   185.199.109.153
   185.199.110.153
   185.199.111.153
   ```

2. **GitHub Repository Settings**:
   - Go to: Settings → Pages
   - Custom domain: `labreporttool.xyz`
   - Enforce HTTPS: ✅ Enabled

## 🔄 **How It Works Now**

### **Local Development** (localhost)
1. Start backend service: `python3 google_drive_backend.py`
2. Open application in browser
3. Files upload via backend service to Google Drive
4. Status shows: ✅ "Backend Service Connected"

### **GitHub Pages** (labreporttool.xyz)
1. Application detects GitHub Pages environment
2. Loads Google API directly
3. User clicks status symbol to authenticate
4. Files upload directly to Google Drive via API
5. Status shows: ✅ "Google Drive Connected"

### **Fallback Behavior**
- If no backend service (local): Downloads files locally
- If no Google authentication (GitHub Pages): Downloads files locally
- Always saves data to browser localStorage as backup

## 📊 **Status Indicators**

| Symbol | Status | Meaning |
|--------|--------|---------|
| ✅ | Connected | Google Drive ready, auto-upload enabled |
| ⚠️ | Warning | Click to authenticate or start backend service |
| ❌ | Error | Connection failed, files download locally |
| 🔄 | Loading | Initializing services |

## 🧪 **Testing the Setup**

### **Test Local Development**
1. Start backend: `python3 google_drive_backend.py`
2. Open `Pharmacy_Compliance_Backend.html`
3. Should show: ✅ "Backend Service Connected"

### **Test GitHub Pages**
1. Visit: https://labreporttool.xyz
2. Should show: ⚠️ "Google Drive Authentication Required"
3. Click the ⚠️ symbol to authenticate
4. Should show: ✅ "Google Drive Connected"

## 🔧 **Troubleshooting**

### **"Authentication Required" on GitHub Pages**
- **Cause**: Google API needs user permission
- **Solution**: Click the status symbol (⚠️) to authenticate

### **"Backend Service Offline" locally**
- **Cause**: Backend service not running
- **Solution**: Run `python3 google_drive_backend.py`

### **"Connection Error"**
- **Cause**: Google Cloud Console not configured
- **Solution**: Follow the Google Cloud Console setup steps above

### **Files Download Instead of Upload**
- **Cause**: No authentication or service available
- **Solution**: Check status symbol and authenticate if needed

## 📋 **Deployment Checklist**

### **Google Cloud Console** ✅
- [ ] OAuth2 Client ID configured with authorized domains
- [ ] API Key configured with HTTP referrers
- [ ] Google Drive API enabled
- [ ] Authorized JavaScript origins added
- [ ] Authorized redirect URIs added

### **GitHub Repository** ✅
- [ ] GitHub Actions workflow deployed
- [ ] GitHub Pages enabled
- [ ] Custom domain configured
- [ ] HTTPS enforced
- [ ] DNS records pointing to GitHub Pages

### **Application** ✅
- [ ] Environment detection working
- [ ] Google API integration added
- [ ] Status indicators functional
- [ ] Authentication flow working
- [ ] Fallback behavior implemented

## 🎯 **Next Steps**

1. **Configure Google Cloud Console** using the steps above
2. **Test the application** on both local and GitHub Pages
3. **Verify file uploads** work in both environments
4. **Train users** on the new authentication flow for GitHub Pages

The application is now ready for professional deployment with full Google Drive integration! 🚀