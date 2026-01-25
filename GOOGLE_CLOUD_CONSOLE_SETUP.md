# 🔧 Google Cloud Console Setup - REQUIRED

## 🚨 **Critical Issue**: Domain Authorization

The error shows that your domain `labreporttool.xyz` is not authorized in Google Cloud Console. This MUST be fixed for Google Drive integration to work.

## 🛠️ **Step-by-Step Fix:**

### **Step 1: Go to Google Cloud Console**
1. **Visit**: https://console.cloud.google.com/apis/credentials
2. **Sign in** with your Google account

### **Step 2: Find Your OAuth 2.0 Client ID**
1. **Look for**: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
2. **Click the pencil icon** to edit it

### **Step 3: Add Authorized JavaScript Origins**
In the "Authorized JavaScript origins" section, add these EXACT URLs:
```
https://labreporttool.xyz
https://www.labreporttool.xyz
https://jared-t-proctor-jtp34.github.io
```

### **Step 4: Add Authorized Redirect URIs**
In the "Authorized redirect URIs" section, add these EXACT URLs:
```
https://labreporttool.xyz
https://www.labreporttool.xyz
https://jared-t-proctor-jtp34.github.io/LabReport/
```

### **Step 5: Configure API Key**
1. **Find your API Key**: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`
2. **Click the pencil icon** to edit it
3. **Under "Website restrictions"**, add:
   ```
   https://labreporttool.xyz/*
   https://www.labreporttool.xyz/*
   https://jared-t-proctor-jtp34.github.io/*
   ```

### **Step 6: Save Changes**
1. **Click "Save"** on both the OAuth Client and API Key
2. **Wait 5-10 minutes** for changes to propagate

## 🧪 **Test After Configuration**

1. **Clear browser cache**: `Ctrl + F5`
2. **Visit**: https://labreporttool.xyz
3. **Check console** - should see:
   ```
   🌐 GitHub Pages detected - skipping backend check
   ✅ Google API and Identity Services loaded successfully
   ⚠️ Google Drive authentication required
   ```
4. **Click status symbol** to test authentication

## ⚠️ **Common Mistakes**

- **Missing https://**: Must include the protocol
- **Wrong domain**: Must be exact match
- **Trailing slashes**: Be consistent with the format above
- **Case sensitivity**: Use exact capitalization

## 🎯 **Expected Result**

After proper configuration:
- ✅ No more "Not a valid origin" errors
- ✅ Google authentication popup works
- ✅ Files upload to Google Drive successfully

**This configuration is MANDATORY for the application to work on GitHub Pages!** 🚀