# 📁 Lab Reports Project Files - Organized Structure

This folder contains all the pharmacy compliance system files, organized for better project management and deployment.

## 📋 File Organization

### **Core Application Files**
- `Pharmacy_Compliance_Backend.html` - Main application with backend service integration
- `index.html` - Entry point that redirects to the main application

### **Backend Services**
- `google_drive_backend.py` - Python backend service for Google Drive uploads
- `test_backend.py` - Backend testing and verification suite

### **SSL/HTTPS Support**
- `cert.pem` - SSL certificate for local HTTPS testing
- `key.pem` - SSL private key for local HTTPS testing
- `local-https-server.py` - Local HTTPS server for development

### **Documentation**
- `README.md` - Complete project documentation
- `TESTING_GUIDE.md` - Testing instructions and troubleshooting
- `GOOGLE_DRIVE_PERMANENT_SETUP.md` - Google Drive integration setup guide

### **DNS & Domain Configuration**
- `CNAME` - Domain configuration for GitHub Pages
- `DNS_CONFIGURATION.md` - Complete DNS setup instructions
- `DNS_BACKUP.txt` - Backup of original DNS settings
- `DNS_QUICK_REFERENCE.txt` - Quick DNS setup reference

### **Project Configuration**
- `.gitignore` - Git ignore rules for the project

## 🚀 Quick Start from Organized Folder

1. **Start Backend Service**:
   ```bash
   cd Labreports
   python3 google_drive_backend.py
   ```
   Then open `Pharmacy_Compliance_Backend.html`

2. **HTTPS Testing** (if needed):
   ```bash
   cd Labreports
   python3 local-https-server.py
   ```
   Then open `https://localhost:8000`

3. **Test Backend Connection**:
   ```bash
   cd Labreports
   python3 test_backend.py
   ```

## 📊 Project Status

✅ **Organized Structure**: All files moved to dedicated folder  
✅ **Backend Integration**: Simplified Google Drive uploads  
✅ **Documentation**: Complete setup and testing guides  
✅ **SSL Support**: Local HTTPS testing capability  
✅ **Domain Ready**: DNS configured for labreporttool.xyz  

This organized structure makes the project easier to:
- Deploy to production
- Test locally
- Maintain and update
- Share with team members
- Version control with Git

## 🎯 What Was Moved

All essential project files have been moved from the desktop to this organized folder:
- Main application files (HTML, Python)
- SSL certificates and server scripts
- Complete documentation and guides
- DNS configuration files
- Testing and verification tools

The desktop now has a clean, organized structure with all Lab Reports files in one dedicated folder.