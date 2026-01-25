# 🚨 Google Drive Not Working - Troubleshooting Guide

## 🔍 Quick Diagnosis

### Most Common Issues:

1. **❌ Domain Not Authorized**
   - **Problem:** Your domain isn't authorized in Google Cloud Console
   - **Solution:** Add your domain to OAuth2 authorized origins

2. **❌ Testing from localhost**
   - **Problem:** Google OAuth2 doesn't work from localhost
   - **Solution:** Test from your live domain (labreporttool.xyz)

3. **❌ API Restrictions**
   - **Problem:** API Key or Client ID has restrictions
   - **Solution:** Check Google Cloud Console restrictions

4. **❌ HTTPS Required**
   - **Problem:** Google OAuth2 requires HTTPS
   - **Solution:** Ensure your domain uses HTTPS

## 🛠️ Step-by-Step Fix

### Step 1: Authorize Your Domain
1. Go to [Google Cloud Console](https://console.cloud.google.com/apis/credentials)
2. Find your OAuth2 Client ID: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2`
3. Click on it to edit
4. Add these to **"Authorized JavaScript origins":**
   ```
   https://labreporttool.xyz
   https://www.labreporttool.xyz
   https://jared-t-proctor-jtp34.github.io
   ```
5. Add these to **"Authorized redirect URIs":**
   ```
   https://labreporttool.xyz
   https://www.labreporttool.xyz
   https://jared-t-proctor-jtp34.github.io/LabReport/
   ```
6. **Save** the changes

### Step 2: Check API Key Restrictions
1. In Google Cloud Console, go to **Credentials**
2. Find your API Key: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`
3. Click on it to edit
4. Under **"API restrictions"**, make sure **Google Drive API** is selected
5. Under **"Website restrictions"**, either:
   - Select **"None"** (less secure but easier)
   - Or add your domains: `labreporttool.xyz`, `*.labreporttool.xyz`, `jared-t-proctor-jtp34.github.io`

### Step 3: Test from the Right Domain
**❌ Don't test from:**
- `localhost`
- `127.0.0.1`
- `file://` protocol

**✅ Test from:**
- `https://labreporttool.xyz` (your custom domain)
- `https://jared-t-proctor-jtp34.github.io/LabReport/` (GitHub Pages)

### Step 4: Use the Diagnostic Tool
1. Go to: `https://labreporttool.xyz/google-drive-test.html`
2. Click **"Run Full Diagnostic"**
3. Follow the recommendations provided

## 🔧 Common Error Messages & Solutions

### "Google Drive Not Configured"
**Cause:** Missing API Key or Client ID
**Solution:** Both are now configured, check domain authorization

### "Authentication Failed"
**Cause:** Domain not authorized or API restrictions
**Solution:** Follow Step 1 and Step 2 above

### "Failed to initialize Google API client"
**Cause:** API Key restrictions or network issues
**Solution:** Check API Key restrictions in Google Cloud Console

### "Upload failed"
**Cause:** Insufficient permissions or folder access issues
**Solution:** Verify folder permissions and API scopes

### Popup blocked or doesn't appear
**Cause:** Browser popup blocker or domain issues
**Solution:** Allow popups and check domain authorization

## 🧪 Testing Checklist

- [ ] Domain is authorized in Google Cloud Console
- [ ] API Key restrictions allow your domain
- [ ] Testing from HTTPS domain (not localhost)
- [ ] Browser allows popups
- [ ] Google Drive API is enabled in Cloud Console
- [ ] Folder ID is correct and accessible

## 🚀 Quick Test Steps

1. **Open your application:** https://labreporttool.xyz
2. **Login** with your credentials
3. **Check Google Drive status** - should show "Google Drive API Ready"
4. **Click "Connect Google Drive"**
5. **Allow popup** if blocked
6. **Complete Google authentication**
7. **Status should change** to "Connected to Google Drive"
8. **Test upload** by generating a report

## 📞 Still Not Working?

If Google Drive still isn't working after following these steps:

1. **Run the diagnostic tool:** https://labreporttool.xyz/google-drive-test.html
2. **Check browser console** for error messages (F12 → Console)
3. **Verify DNS propagation** for your domain
4. **Wait 5-10 minutes** after making Google Cloud Console changes
5. **Try a different browser** to rule out browser-specific issues

## 🔍 Browser Console Commands

Open browser console (F12) and run these to check status:

```javascript
// Check if APIs loaded
console.log('GAPI:', typeof gapi !== 'undefined');
console.log('Google Identity:', typeof google !== 'undefined');

// Check configuration
console.log('Client ID set:', !!GOOGLE_CLIENT_ID);
console.log('API Key set:', !!GOOGLE_API_KEY);

// Check current status
console.log('Drive status:', document.getElementById('driveStatusText').textContent);
```

---

**Most likely fix:** Authorize your domain in Google Cloud Console OAuth2 settings!