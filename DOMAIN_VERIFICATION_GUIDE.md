# 🌐 Domain Ownership Verification - labreporttool.xyz

## 🚨 **ISSUE IDENTIFIED**
Google Cloud Console is showing: "The website of your home page URL 'https://labreporttool.xyz' is not registered to you. Verify ownership of your home page."

## 🔧 **SOLUTION: Domain Verification Process**

### **Step 1: Access Google Search Console**
1. **Go to**: https://search.google.com/search-console/
2. **Sign in** with the same Google account used for Google Cloud Console
3. **Click**: "Add Property"

### **Step 2: Add Your Domain**
1. **Choose**: "URL prefix" (not "Domain")
2. **Enter**: `https://labreporttool.xyz`
3. **Click**: "Continue"

### **Step 3: Verify Ownership (Choose One Method)**

#### **Method A: HTML File Upload (Recommended)**
1. **Download** the HTML verification file from Google Search Console
2. **Upload** it to your website root directory
3. **Ensure** it's accessible at: `https://labreporttool.xyz/google[verification-code].html`
4. **Click**: "Verify" in Google Search Console

#### **Method B: HTML Meta Tag (Alternative)**
1. **Copy** the meta tag provided by Google Search Console
2. **Add** it to the `<head>` section of your `index.html`
3. **Deploy** the updated file to your website
4. **Click**: "Verify" in Google Search Console

#### **Method C: DNS Record (Advanced)**
1. **Add** a TXT record to your domain's DNS settings
2. **Use** the verification string provided by Google
3. **Wait** for DNS propagation (up to 24 hours)
4. **Click**: "Verify" in Google Search Console

## 🚀 **RECOMMENDED APPROACH: HTML Meta Tag**

### **Quick Implementation:**
I'll add the meta tag to your `index.html` file. You'll need to:

1. **Get the meta tag** from Google Search Console
2. **Replace the placeholder** in the updated `index.html`
3. **Deploy** to your website
4. **Verify** in Google Search Console

### **Meta Tag Location:**
The meta tag should be added to the `<head>` section like this:
```html
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-site-verification" content="YOUR_VERIFICATION_CODE_HERE" />
<title>Pharmacy Compounding Compliance Log - Professional USP Monitoring System</title>
```

## 📋 **ALTERNATIVE SOLUTION: Use GitHub Pages URL**

### **If Domain Verification is Complex:**
You can temporarily use your GitHub Pages URL for OAuth consent screen:

1. **In Google Cloud Console OAuth consent screen**:
   - **App domain**: `jared-t-proctor-jtp34.github.io`
   - **Privacy Policy URL**: `https://jared-t-proctor-jtp34.github.io/LabReport/privacy-policy.html`
   - **Terms of Service URL**: `https://jared-t-proctor-jtp34.github.io/LabReport/terms-of-service.html`

2. **Authorized JavaScript Origins**:
   ```
   https://jared-t-proctor-jtp34.github.io
   https://labreporttool.xyz
   ```

3. **Authorized Redirect URIs**:
   ```
   https://jared-t-proctor-jtp34.github.io/LabReport/
   https://labreporttool.xyz
   ```

## 🔍 **VERIFICATION STEPS**

### **Check Current Domain Setup:**
1. **Visit**: https://labreporttool.xyz
2. **Verify**: Website loads correctly
3. **Check**: DNS settings point to GitHub Pages
4. **Confirm**: CNAME file contains `labreporttool.xyz`

### **DNS Configuration Check:**
Your domain should have these DNS records:
```
Type: CNAME
Name: @ (or labreporttool.xyz)
Value: jared-t-proctor-jtp34.github.io
```

## 🛠️ **IMPLEMENTATION PLAN**

### **Option 1: Complete Domain Verification (Recommended)**
1. **Add verification meta tag** to `index.html`
2. **Deploy** updated file to GitHub
3. **Verify** domain in Google Search Console
4. **Use** `labreporttool.xyz` in OAuth consent screen

### **Option 2: Use GitHub Pages Temporarily**
1. **Configure OAuth consent screen** with GitHub Pages URLs
2. **Test** Google Drive integration
3. **Complete domain verification** later
4. **Update** OAuth consent screen with custom domain

## 📞 **TROUBLESHOOTING**

### **If Domain Doesn't Load:**
- Check DNS propagation: https://dnschecker.org/
- Verify CNAME file in repository root
- Ensure GitHub Pages is enabled for custom domain

### **If Verification Fails:**
- Wait 24-48 hours for DNS propagation
- Clear browser cache and try again
- Use alternative verification method
- Contact domain registrar for DNS support

## 🎯 **EXPECTED TIMELINE**

### **Quick Solution (GitHub Pages)**: 5 minutes
- Update OAuth consent screen with GitHub Pages URLs
- Test Google Drive integration immediately

### **Complete Solution (Domain Verification)**: 24-48 hours
- Add verification meta tag
- Wait for Google to verify domain ownership
- Update OAuth consent screen with custom domain

## 🚀 **NEXT STEPS**

1. **Choose your approach** (domain verification vs GitHub Pages)
2. **Follow the implementation plan** above
3. **Test the OAuth consent screen** configuration
4. **Verify Google Drive integration** works

**I recommend starting with GitHub Pages URLs to get the application working immediately, then completing domain verification for the final professional setup.**