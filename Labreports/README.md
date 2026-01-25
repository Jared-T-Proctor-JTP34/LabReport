# 🧪 Pharmacy Compounding Compliance Log System

A comprehensive web-based compliance tracking system for pharmacy compounding operations, featuring automatic Google Drive integration and USP compliance monitoring for areas 795, 797, and 800.

## 🎯 Overview

This system provides real-time monitoring and documentation of pharmacy compounding environments to ensure compliance with USP (United States Pharmacopeia) standards. It automatically generates professional PDF reports and uploads them to Google Drive with two implementation options: direct OAuth integration or backend service (no user authentication required).

## ✨ Key Features

### 📊 **Compliance Monitoring**
- **USP 795**: Non-sterile compounding area monitoring
- **USP 797**: Sterile compounding area with pressure monitoring
- **USP 800**: Hazardous drug compounding with negative pressure
- Real-time compliance validation against USP standards
- Temperature, humidity, and air pressure tracking

### 📋 **Automated Reporting**
- Professional PDF report generation with area-specific branding
- Automatic file naming: "Labreport - MM-DD-YYYY.pdf"
- Compliance statistics and historical data analysis
- Clean, easy-to-read format for regulatory review

### 🔐 **User Management**
- Role-based access control (Admin, Pharmacist, Technician)
- Secure login system with predefined credentials
- Session management and automatic logout

### 🧽 **Cleaning Task Tracking**
- Daily cleaning task checklists for each area
- Surface, floor, equipment, and hood cleaning verification
- Integration with compliance reports

### 📈 **Historical Data**
- Complete monitoring history with statistics
- Compliance rate calculations
- Expandable history sections with detailed tables
- Local browser storage with export capabilities

### ☁️ **Google Drive Integration**
- **Dual Integration**: Backend service (local) + Direct Google API (GitHub Pages)
- **Environment Detection**: Automatically uses appropriate integration method
- **Smart Authentication**: Click-to-authenticate on GitHub Pages
- **Automatic PDF uploads** to designated Google Drive folder
- **Fallback to local download** if no service available
- **Enhanced status indicators** show connection status with tooltips

## 🏗️ Architecture

### **Frontend Application**
- `Pharmacy_Compliance_Backend.html` - Main application with dual integration support
- `index.html` - Entry point that redirects to the main application
- **Environment Detection**: Automatically detects local vs GitHub Pages deployment
- **Dual Integration**: Backend service for local + Direct Google API for GitHub Pages

### **Backend Service** (Local Development)
- `google_drive_backend.py` - Python backend for Google Drive uploads
- Handles authentication and file uploads server-side
- CORS-enabled for frontend integration
- Automatic local backup if Google Drive unavailable

### **GitHub Pages Integration** (Production)
- Direct Google API integration using OAuth2
- Click-to-authenticate user flow
- Automatic deployment via GitHub Actions
- Custom domain support (labreporttool.xyz)

### **Development Tools**
- Local HTTPS server setup for testing Google APIs
- Comprehensive testing suite for Google Drive connectivity
- SSL certificate generation for local development
- Multiple diagnostic and verification tools

## 🚀 Quick Start

### **GitHub Pages (Production)**
1. **Visit**: https://labreporttool.xyz or https://jared-t-proctor-jtp34.github.io/LabReport/
2. **Authenticate**: Click the status symbol (⚠️) to connect to Google Drive
3. **Login**: Use demo credentials below
4. **Start monitoring**: Records automatically upload to Google Drive

### **Local Development**
1. **Start the backend service**:
   ```bash
   cd Labreports
   python3 google_drive_backend.py
   ```

2. **Open the application**:
   - Open `Pharmacy_Compliance_Backend.html` in your browser
   - Or use `index.html` which automatically redirects

3. **Login with demo credentials**:
   - admin / pharmacy123
   - pharmacist / compound456  
   - tech / sterile789

## Login Credentials

| Username | Password | Role |
|----------|----------|------|
| admin | pharmacy123 | Administrator |
| pharmacist | compound456 | Pharmacist |
| tech | sterile789 | Technician |

## 📋 USP Compliance Standards

### **USP 795 - Non-Sterile Compounding**
- Temperature: 68-77°F
- Humidity: ≤60% RH
- No pressure requirements

### **USP 797 - Sterile Compounding**
- Temperature: 68-77°F
- Humidity: ≤60% RH
- Air Pressure: +0.01 to +0.05 inches WC (positive pressure)

### **USP 800 - Hazardous Drug Compounding**
- Temperature: 68-77°F
- Humidity: ≤60% RH
- Air Pressure: -0.01 to -0.05 inches WC (negative pressure)

## 🛠️ Configuration

### **Google Drive Setup**
1. Create Google Cloud Console project
2. Enable Google Drive API
3. Create OAuth2 credentials or service account
4. Configure authorized domains and redirect URIs
5. Update configuration in application files

### **Domain Configuration**
- Primary domain: `labreporttool.xyz`
- DNS configuration included in repository
- SSL certificates for local development

## 📁 File Structure

```
Labreports/
├── .github/
│   └── workflows/
│       └── deploy.yml                    # GitHub Actions deployment workflow
├── .gitignore                           # Git ignore rules
├── CNAME                                # Custom domain configuration (labreporttool.xyz)
├── index.html                           # Entry point (redirects to main app)
├── Pharmacy_Compliance_Backend.html     # Main application with dual integration
├── google_drive_backend.py              # Backend service for local development
├── README.md                            # Project documentation
├── GITHUB_GOOGLE_API_SETUP.md          # Google Cloud Console setup guide
├── TESTING_GUIDE.md                     # Testing instructions
├── test_backend.py                      # Backend testing suite
├── local-https-server.py                # Local HTTPS server for development
├── cert.pem                             # SSL certificate (local development)
└── key.pem                              # SSL private key (local development)
```

## 🧪 Testing

### **Backend Service Test**
```bash
python3 test_backend.py
```

### **Google Drive Connectivity**
```bash
python3 test_backend.py
```

### **Manual Testing**
- Use `test_backend.py` for backend service verification
- Test the main application directly in browser

## 🔧 Development

### **Local Development Setup**
1. Install Python dependencies: `requests`, `cryptography`
2. Generate SSL certificates for HTTPS testing
3. Configure Google Cloud Console credentials
4. Set up local backend service

### **Code Structure**
- **Modular Configuration**: Centralized settings in CONFIG object
- **Utility Functions**: Reusable components in utils object
- **State Management**: Centralized state handling
- **Error Handling**: Comprehensive fallback mechanisms

## 📊 Monitoring & Compliance

### **Real-time Validation**
- Instant compliance checking against USP standards
- Visual indicators for compliant/non-compliant readings
- Automatic alerts for out-of-range values

### **Report Generation**
- Professional PDF formatting with area-specific colors
- Compliance statistics and trend analysis
- Historical data integration
- Regulatory-ready documentation

## 🌐 Deployment

### **Production Deployment** (GitHub Pages)
1. **Automatic Deployment**: GitHub Actions deploys on every push to main
2. **Live URL**: https://labreporttool.xyz
3. **GitHub Pages URL**: https://jared-t-proctor-jtp34.github.io/LabReport/
4. **Google API Integration**: Direct OAuth2 authentication
5. **Custom Domain**: Configured with DNS A records

### **Local Development**
1. **Backend Service**: Run `python3 google_drive_backend.py`
2. **Local URL**: Open `Pharmacy_Compliance_Backend.html` in browser
3. **Google Integration**: Via backend service (no user authentication)
4. **Testing Tools**: Comprehensive suite for development

### **Security Considerations**
- **HTTPS Required**: Google API integration requires secure connections
- **Domain Authorization**: Google Cloud Console configured for authorized domains
- **Secure Credential Management**: API keys and client IDs properly configured
- **CORS Configuration**: Cross-origin requests properly handled
- **Session Management**: Automatic logout and secure login flow

## 📞 Support & Documentation

- **Setup Guide**: `GITHUB_GOOGLE_API_SETUP.md` - Complete Google Cloud Console configuration
- **Testing Guide**: `TESTING_GUIDE.md` - Testing instructions for both environments
- **GitHub Actions**: `.github/workflows/deploy.yml` - Automatic deployment configuration

## 🎉 Benefits

- **Regulatory Compliance**: Meets USP standards for pharmaceutical compounding
- **Automation**: Reduces manual documentation overhead
- **Accessibility**: Web-based, works on any device with a browser
- **Reliability**: Multiple fallback mechanisms ensure data is never lost
- **Professional**: Generates regulatory-ready documentation
- **Scalable**: Easy to deploy and maintain across multiple locations
- **No Authentication Required**: Backend service option eliminates user authentication complexity

## 🔄 Recent Updates (v2.2)

- ✅ **GitHub Pages Integration**: Direct Google API support for production deployment
- ✅ **Environment Detection**: Automatically detects local vs GitHub Pages deployment
- ✅ **Dual Integration**: Backend service (local) + Direct Google API (GitHub Pages)
- ✅ **Click Authentication**: Simple click-to-authenticate flow on GitHub Pages
- ✅ **Enhanced Status Indicators**: Clear visual feedback with tooltips and click actions
- ✅ **GitHub Actions Deployment**: Automatic deployment to GitHub Pages
- ✅ **Custom Domain Support**: Full integration with labreporttool.xyz
- ✅ **Smart Fallbacks**: Downloads locally if no service available
- ✅ **Professional Deployment**: Ready for production use with full Google Drive integration

---

**Version**: 2.2  
**Last Updated**: January 2026  
**License**: MIT  
**Production URL**: https://labreporttool.xyz  
**GitHub Pages**: https://jared-t-proctor-jtp34.github.io/LabReport/  
**Repository**: https://github.com/Jared-T-Proctor-JTP34/LabReport