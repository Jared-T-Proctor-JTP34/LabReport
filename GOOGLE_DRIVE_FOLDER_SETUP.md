# 📁 Google Drive Folder Setup Guide

## 🔍 Current Configuration

**Your current folder ID:** `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`

**Direct link to your folder:** https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc

## ✅ How to Verify Your Current Folder

### Step 1: Check if the folder exists
1. **Click this link:** https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc
2. **If it opens:** ✅ Your folder exists and is accessible
3. **If it shows "Not found":** ❌ You need to create a new folder or get the correct ID

### Step 2: Verify folder permissions
- **Make sure you own the folder** or have write access
- **Check that it's not in Trash**
- **Ensure it's not restricted**

## 🆕 How to Create a New Folder (if needed)

### Option 1: Create via Google Drive Web Interface
1. **Go to:** https://drive.google.com/
2. **Click "New"** → **"Folder"**
3. **Name it:** `Pharmacy Compliance Reports` (or any name you prefer)
4. **Click "Create"**
5. **Copy the folder ID** from the URL (see instructions below)

### Option 2: Create via API (Advanced)
The application can create folders automatically, but manual creation is easier.

## 🔗 How to Get the Correct Folder ID

### Method 1: From Google Drive URL
1. **Open your folder** in Google Drive
2. **Look at the URL** in your browser:
   ```
   https://drive.google.com/drive/folders/FOLDER_ID_HERE
   ```
3. **Copy the ID** after `/folders/`

### Method 2: From Folder Sharing
1. **Right-click your folder** in Google Drive
2. **Click "Share"**
3. **Click "Copy link"**
4. **Extract the ID** from the link:
   ```
   https://drive.google.com/drive/folders/FOLDER_ID_HERE?usp=sharing
   ```

## 🔧 How to Update the Folder ID in Your Application

If you need to change to a different folder, update this line in your HTML file:

**Current setting:**
```javascript
const TARGET_FOLDER_ID = '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc';
```

**Change to your new folder ID:**
```javascript
const TARGET_FOLDER_ID = 'YOUR_NEW_FOLDER_ID_HERE';
```

## 🧪 How to Test Your Folder Configuration

### Option 1: Use the Connection Test Tool
1. **Visit:** https://labreporttool.xyz/google-cloud-connection-test.html
2. **Run the full test**
3. **Click "Test Upload"** after authentication
4. **Check if file appears** in your Google Drive folder

### Option 2: Use the Main Application
1. **Go to:** https://labreporttool.xyz
2. **Login** to the application
3. **Connect to Google Drive**
4. **Generate a test report**
5. **Check your Google Drive folder** for the uploaded file

## 🔍 Folder Structure Recommendations

### Recommended folder organization:
```
📁 Pharmacy Compliance Reports/
├── 📁 USP 795 - Non-Sterile/
├── 📁 USP 797 - Sterile/
├── 📁 USP 800 - Hazardous/
└── 📁 Archive/
```

### Current setup:
- **All reports go to one folder:** `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`
- **Files are named by area and date:** e.g., `Sterile_USP_797_Report_2026-01-24.html`

## 🛠️ Troubleshooting Folder Issues

### Issue: "Folder not found" error
**Solutions:**
1. **Check folder ID** - make sure it's correct
2. **Verify permissions** - ensure you own or can write to the folder
3. **Check if folder is in Trash** - restore if needed

### Issue: "Insufficient permissions" error
**Solutions:**
1. **Make sure you own the folder**
2. **Check folder sharing settings**
3. **Verify Google Drive API scope** includes file creation

### Issue: Files not appearing in folder
**Solutions:**
1. **Check the correct folder** - verify the ID matches
2. **Look in "My Drive" root** - files might be going there instead
3. **Check Trash** - files might be automatically deleted

## 🔐 Permissions and Scopes

### Current API Scope:
```javascript
const SCOPES = 'https://www.googleapis.com/auth/drive.file';
```

**This scope allows:**
- ✅ Create files in specified folders
- ✅ Read/write files created by the application
- ❌ Access existing files not created by the application

### If you need broader access:
```javascript
const SCOPES = 'https://www.googleapis.com/auth/drive';
```

**This scope allows:**
- ✅ Full access to Google Drive
- ✅ Read all files and folders
- ✅ Create files anywhere

## 📋 Quick Checklist

- [ ] Folder ID is correct: `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`
- [ ] Folder exists and is accessible
- [ ] You have write permissions to the folder
- [ ] Folder is not in Trash
- [ ] Google Drive API is enabled in Google Cloud Console
- [ ] API scope includes file creation permissions
- [ ] Application is authenticated with Google Drive

## 🆘 Need to Change Folders?

If you want to use a different folder:

1. **Create or find your desired folder** in Google Drive
2. **Get the folder ID** from the URL
3. **Update the code** (I can help you with this)
4. **Test the new configuration**

**Current folder link:** https://drive.google.com/drive/folders/1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc

Let me know if you need to change to a different folder!