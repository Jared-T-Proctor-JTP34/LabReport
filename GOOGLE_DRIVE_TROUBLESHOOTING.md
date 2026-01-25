# 🔧 Google Drive Integration Troubleshooting Guide

## 🚨 **Common Issues & Solutions**

### **Issue 1: "Not a valid origin for the client"**
**Cause**: Domain not authorized in Google Cloud Console  
**Solution**: 
1. Go to https://console.cloud.google.com/apis/credentials
2. Edit your OAuth 2.0 Client ID
3. Add these **Authorized JavaScript origins**:
   ```
   https://labreporttool.xyz
   https://www.labreporttool.xyz
   https://jared-t-proctor-jtp34.github.io
   ```

### **Issue 2: "API key not valid"**
**Cause**: API key restrictions too strict  
**Solution**:
1. Go to https://console.cloud.google.com/apis/credentials
2. Edit your API Key
3. Under "Website restrictions", add:
   ```
   https://labreporttool.xyz/*
   https://www.labreporttool.xyz/*
   https://jared-t-proctor-jtp34.github.io/*
   ```

### **Issue 3: "Failed to load Google API"**
**Cause**: Network or script loading issue  
**Solution**:
1. Check internet connection
2. Disable ad blockers temporarily
3. Try refreshing the page
4. Check browser console for specific errors

### **Issue 4: Authentication popup blocked**
**Cause**: Browser blocking popups  
**Solution**:
1. Allow popups for labreporttool.xyz
2. Click the status symbol again to retry
3. Check for popup blocker notifications

### **Issue 5: "Access denied" during authentication**
**Cause**: User denied Google Drive permissions  
**Solution**:
1. Click authenticate again
2. Grant all requested permissions
3. Make sure to select the correct Google account

## 🧪 **Testing Steps**

### **Step 1: Check Google Cloud Console Configuration**
1. **Visit**: https://console.cloud.google.com/apis/credentials
2. **Verify OAuth Client ID**:
   - Client ID: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
   - Authorized origins include your domain
3. **Verify API Key**:
   - API Key: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`
   - HTTP referrers include your domain

### **Step 2: Test the Application**
1. **Visit**: https://labreporttool.xyz
2. **Open Browser Console** (F12)
3. **Look for messages** starting with:
   - 🔄 (loading messages)
   - ✅ (success messages)
   - ❌ (error messages)

### **Step 3: Test Authentication**
1. **Click the status symbol** (⚠️ or 🔄)
2. **Complete Google authentication** in popup
3. **Check for success message**: ✅ "Google Drive Connected"

### **Step 4: Test File Upload**
1. **Login** with demo credentials (admin/pharmacy123)
2. **Record data** in any USP area
3. **Check console** for upload success/failure messages
4. **Verify file** appears in Google Drive folder

## 🔍 **Debug Information**

### **Browser Console Messages**
Look for these specific messages:

**Success Messages:**
- ✅ Google API loaded successfully
- ✅ User already authenticated with Google Drive
- ✅ Google Drive authentication successful
- ✅ Google Drive connection test successful

**Error Messages:**
- ❌ Google API initialization failed
- ❌ Failed to load Google API script
- ❌ Google authentication failed
- ❌ Google Drive connection test failed

### **Network Tab**
Check for failed requests to:
- `https://apis.google.com/js/api.js`
- `https://accounts.google.com/`
- `https://www.googleapis.com/`

## 🛠️ **Advanced Troubleshooting**

### **Clear Browser Data**
1. Clear cookies and site data for labreporttool.xyz
2. Clear localStorage data
3. Refresh the page and try again

### **Try Different Browser**
1. Test in Chrome (recommended for Google APIs)
2. Test in incognito/private mode
3. Disable all browser extensions temporarily

### **Check Google Drive Folder**
1. **Visit**: https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
2. **Verify**: You have access to the folder
3. **Check**: Folder permissions allow file uploads

## 📞 **Getting Help**

### **Error Reporting**
When reporting issues, include:
1. **Browser**: Chrome, Firefox, Safari, etc.
2. **Error Messages**: From browser console
3. **Steps Taken**: What you tried before the error
4. **Screenshots**: Of error messages or console

### **Useful Links**
- **Google Cloud Console**: https://console.cloud.google.com/
- **Google Drive API Documentation**: https://developers.google.com/drive/api
- **OAuth 2.0 Troubleshooting**: https://developers.google.com/identity/protocols/oauth2

## 🎯 **Quick Fix Checklist**

- [ ] Google Cloud Console domains configured correctly
- [ ] API key restrictions set properly
- [ ] Google Drive API enabled
- [ ] Browser allows popups for the domain
- [ ] Internet connection stable
- [ ] Using supported browser (Chrome recommended)
- [ ] No ad blockers interfering
- [ ] Google account has Drive access
- [ ] Target folder accessible

## 🚀 **Expected Behavior**

**On Page Load:**
1. Application detects GitHub Pages environment
2. Attempts to load Google API
3. Shows ⚠️ "Authentication Required" status

**On Authentication:**
1. User clicks status symbol
2. Google popup opens for authentication
3. User grants permissions
4. Status changes to ✅ "Google Drive Connected"

**On File Upload:**
1. User records compliance data
2. PDF generated automatically
3. File uploaded to Google Drive folder
4. Success message displayed

---

**🌐 Live Application**: https://labreporttool.xyz  
**📁 Google Drive Folder**: https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc  
**⚙️ Google Cloud Console**: https://console.cloud.google.com/apis/credentials