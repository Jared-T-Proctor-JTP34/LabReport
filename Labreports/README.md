# 🧪 Pharmacy Compounding Compliance Log System

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://labreporttool.xyz)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/Version-2.2-blue.svg)](https://github.com/Jared-T-Proctor-JTP34/LabReport)

A comprehensive web-based compliance tracking system for pharmacy compounding operations, featuring automatic Google Drive integration and USP compliance monitoring for areas 795, 797, and 800.

## 🌐 **Live Application**

- **Production**: [https://labreporttool.xyz](https://labreporttool.xyz)
- **GitHub Pages**: [https://jared-t-proctor-jtp34.github.io/LabReport/](https://jared-t-proctor-jtp34.github.io/LabReport/)

## 🎯 **Overview**

This system provides real-time monitoring and documentation of pharmacy compounding environments to ensure compliance with USP (United States Pharmacopeia) standards. It automatically generates professional PDF reports and uploads them to Google Drive with dual integration options: direct OAuth integration for GitHub Pages and backend service for local development.

### **Key Features**

- 📊 **Real-time USP Compliance Monitoring** for three compounding areas
- 📋 **Automatic PDF Report Generation** with professional formatting
- ☁️ **Google Drive Integration** with dual deployment options
- 🔐 **Role-based Access Control** with secure login system
- 🧽 **Daily Cleaning Task Tracking** with verification checkboxes
- 📈 **Historical Data Analysis** with compliance statistics
- 🌐 **GitHub Pages Deployment** with automatic CI/CD

## 📊 **USP Compliance Areas**

### **USP 795 - Non-Sterile Compounding**
- **Temperature**: 68-77°F
- **Humidity**: ≤60% RH
- **Pressure**: No requirements
- **Color Code**: Green

### **USP 797 - Sterile Compounding**
- **Temperature**: 68-77°F
- **Humidity**: ≤60% RH
- **Air Pressure**: +0.01 to +0.05 inches WC (positive pressure)
- **Color Code**: Blue

### **USP 800 - Hazardous Drug Compounding**
- **Temperature**: 68-77°F
- **Humidity**: ≤60% RH
- **Air Pressure**: -0.01 to -0.05 inches WC (negative pressure)
- **Color Code**: Orange

## 🚀 **Quick Start**

### **Option 1: GitHub Pages (Production)**
1. **Visit**: [https://labreporttool.xyz](https://labreporttool.xyz)
2. **Authenticate**: Click the status symbol (⚠️) to connect to Google Drive
3. **Login**: Use demo credentials below
4. **Start monitoring**: Records automatically upload to Google Drive

### **Option 2: Local Development**
1. **Clone the repository**:
   ```bash
   git clone https://github.com/Jared-T-Proctor-JTP34/LabReport.git
   cd LabReport/Labreports
   ```

2. **Start the backend service**:
   ```bash
   python3 google_drive_backend.py
   ```

3. **Open the application**:
   - Open `Pharmacy_Compliance_Backend.html` in your browser
   - Or use `index.html` which automatically redirects

4. **Login with demo credentials**:
   - admin / pharmacy123
   - pharmacist / compound456  
   - tech / sterile789

## 🔐 **Login Credentials**

| Username | Password | Role | Permissions |
|----------|----------|------|-------------|
| admin | pharmacy123 | Administrator | Full access to all areas |
| pharmacist | compound456 | Pharmacist | All compounding areas |
| tech | sterile789 | Technician | Basic monitoring access |

## 🏗️ **System Architecture**

### **Dual Integration Design**

The application features a sophisticated dual integration system that automatically detects the deployment environment and uses the appropriate Google Drive integration method:

#### **Local Development Environment**
- **Backend Service**: `google_drive_backend.py` handles all Google Drive operations
- **No User Authentication**: Seamless operation without OAuth prompts
- **Local Fallback**: Automatic local file backup if Google Drive unavailable
- **Status**: ✅ "Backend Service Connected"

#### **GitHub Pages Environment**
- **Direct Google API**: OAuth2 authentication with Google Drive API
- **Click Authentication**: Simple click-to-authenticate user flow
- **Environment Detection**: Automatic detection of GitHub Pages deployment
- **Status**: ⚠️ "Click to authenticate" → ✅ "Google Drive Connected"

### **Smart Fallback System**
1. **Try Backend Service** (local development)
2. **Try Google Drive API** (GitHub Pages)
3. **Fallback to Local Download** (if all else fails)

## 📁 **Project Structure**

```
Labreports/
├── 📱 Core Application
│   ├── Pharmacy_Compliance_Backend.html    # Main application with dual integration
│   ├── index.html                          # Entry point (redirects to main app)
│   ├── google_drive_backend.py             # Backend service for local development
│   └── README.md                           # This documentation
├── 🚀 GitHub Pages Deployment
│   ├── .github/workflows/deploy.yml        # GitHub Actions automatic deployment
│   ├── CNAME                               # Custom domain configuration
│   └── .gitignore                          # Git ignore rules
├── 📚 Documentation & Setup
│   ├── GITHUB_GOOGLE_API_SETUP.md          # Google Cloud Console setup guide
│   └── TESTING_GUIDE.md                    # Testing instructions
└── 🛠️ Development Tools
    ├── test_backend.py                     # Backend testing suite
    ├── local-https-server.py               # Local HTTPS server
    ├── cert.pem                            # SSL certificate for development
    └── key.pem                             # SSL private key for development
```

## ⚙️ **Core Functionality**

### **1. Real-Time Compliance Monitoring**
- **Instant Validation**: Real-time checking against USP standards
- **Visual Indicators**: Color-coded compliance status (✅ Compliant, ❌ Non-compliant)
- **Automatic Alerts**: Immediate notification for out-of-range values
- **Historical Tracking**: Complete monitoring history with statistics

### **2. Professional PDF Report Generation**
- **Area-Specific Branding**: Color-coded reports for each compounding area
- **Compliance Statistics**: Automatic calculation of compliance rates
- **Professional Formatting**: Regulatory-ready documentation
- **Automatic Naming**: "Labreport - MM-DD-YYYY.pdf" format

### **3. Google Drive Integration**
- **Automatic Uploads**: Seamless integration with designated Google Drive folder
- **Dual Methods**: Backend service (local) + Direct API (GitHub Pages)
- **Fallback Protection**: Local download if upload fails
- **Status Monitoring**: Real-time connection status with visual indicators

### **4. Daily Cleaning Task Management**
- **Interactive Checklists**: Checkbox verification for daily tasks
- **Task Categories**: Surface, floor, equipment, and hood cleaning
- **Report Integration**: Cleaning tasks included in compliance reports
- **Visual Feedback**: Clear indication of completed tasks

### **5. Historical Data Analysis**
- **Expandable History**: Collapsible sections for each compounding area
- **Statistics Dashboard**: Total records, compliance rates, date ranges
- **Detailed Tables**: Complete monitoring history with all parameters
- **Data Persistence**: Browser localStorage with cloud backup

## 🌐 **Deployment Options**

### **GitHub Pages (Recommended for Production)**

#### **Automatic Deployment**
- **GitHub Actions**: Automatic deployment on every push to main branch
- **Custom Domain**: Configured for `labreporttool.xyz`
- **SSL Certificate**: Automatic HTTPS with GitHub Pages
- **Global CDN**: Fast loading worldwide

#### **Setup Requirements**
1. **Google Cloud Console Configuration** (see `GITHUB_GOOGLE_API_SETUP.md`)
2. **DNS Configuration**: A records pointing to GitHub Pages
3. **Repository Settings**: GitHub Pages enabled with custom domain

### **Local Development**

#### **Backend Service Setup**
```bash
# Install Python dependencies
pip install requests

# Start backend service
python3 google_drive_backend.py

# Server runs at http://localhost:8001
```

#### **HTTPS Development Server**
```bash
# Generate SSL certificates (included)
python3 local-https-server.py

# HTTPS server for Google API testing
```

## 🔧 **Configuration**

### **Google Drive Setup**
- **Folder ID**: `1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc`
- **Client ID**: `465131191592-kkd73c4d57upufd13njhoue4f4p1ggo2.apps.googleusercontent.com`
- **API Key**: `AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk`

### **Environment Detection**
```javascript
// Automatic environment detection
const isLocalhost = location.hostname === 'localhost' || location.hostname === '127.0.0.1';
const isGitHubPages = location.hostname.includes('github.io') || location.hostname === 'labreporttool.xyz';

// Dynamic configuration based on environment
const CONFIG = {
  BACKEND_URL: isLocalhost ? 'http://localhost:8001' : 'https://api.labreporttool.xyz',
  ENVIRONMENT: isLocalhost ? 'development' : 'production'
};
```

## 🧪 **Testing**

### **Automated Testing**
```bash
# Test backend service
python3 test_backend.py

# Expected output:
# ✅ Backend service running
# ✅ Status endpoint responding
# ✅ Upload endpoint functional
```

### **Manual Testing Scenarios**

#### **Local Development Test**
1. Start backend: `python3 google_drive_backend.py`
2. Open application in browser
3. Should show: ✅ "Backend Service Connected"
4. Record data → Should upload via backend service

#### **GitHub Pages Test**
1. Visit: [https://labreporttool.xyz](https://labreporttool.xyz)
2. Should show: ⚠️ "Google Drive Authentication Required"
3. Click ⚠️ symbol → Google authentication popup
4. After auth: ✅ "Google Drive Connected"
5. Record data → Should upload via Google API

## 📊 **Status Indicators**

| Symbol | Status | Environment | Action Required |
|--------|--------|-------------|-----------------|
| ✅ | Connected | Both | Ready for uploads |
| ⚠️ | Authentication Required | GitHub Pages | Click to authenticate |
| ⚠️ | Backend Offline | Local | Start backend service |
| ❌ | Connection Error | Both | Check configuration |
| 🔄 | Initializing | Both | Wait for connection |

## 🔒 **Security Features**

### **Authentication & Authorization**
- **Role-based Access**: Different permission levels for admin, pharmacist, tech
- **Session Management**: Automatic logout and secure login flow
- **Credential Protection**: Demo credentials for testing, configurable for production

### **Data Protection**
- **HTTPS Required**: All Google API communications over secure connections
- **Local Backup**: Automatic browser localStorage backup
- **Error Handling**: Graceful fallbacks prevent data loss

### **API Security**
- **Domain Restrictions**: Google API keys restricted to authorized domains
- **OAuth2 Flow**: Secure authentication with Google Drive
- **CORS Configuration**: Proper cross-origin request handling

## 📈 **Performance Features**

### **Optimized Loading**
- **Lazy Loading**: History sections load on demand
- **Efficient Storage**: Optimized localStorage usage
- **Fast Rendering**: Minimal DOM manipulation

### **Responsive Design**
- **Mobile Friendly**: Works on tablets and mobile devices
- **Progressive Enhancement**: Core functionality works without JavaScript
- **Accessibility**: Screen reader compatible

## 🛠️ **Development**

### **Local Development Setup**
1. **Clone Repository**:
   ```bash
   git clone https://github.com/Jared-T-Proctor-JTP34/LabReport.git
   cd LabReport/Labreports
   ```

2. **Install Dependencies**:
   ```bash
   pip install requests cryptography
   ```

3. **Start Development Server**:
   ```bash
   python3 google_drive_backend.py
   ```

4. **Open Application**:
   - Open `Pharmacy_Compliance_Backend.html` in browser
   - Or use local HTTPS server for Google API testing

### **Code Structure**
- **Modular Configuration**: Centralized settings in CONFIG object
- **Utility Functions**: Reusable components in utils object
- **State Management**: Centralized state handling
- **Error Handling**: Comprehensive fallback mechanisms

### **Contributing**
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly (both local and GitHub Pages)
5. Submit a pull request

## 📞 **Support & Documentation**

### **Setup Guides**
- **Google Cloud Console**: `GITHUB_GOOGLE_API_SETUP.md` - Complete configuration guide
- **Testing Instructions**: `TESTING_GUIDE.md` - Comprehensive testing procedures
- **GitHub Actions**: `.github/workflows/deploy.yml` - Automatic deployment configuration

### **Troubleshooting**

#### **Common Issues**

**"Authentication Required" on GitHub Pages**
- **Cause**: Google API needs user permission
- **Solution**: Click the status symbol (⚠️) to authenticate

**"Backend Service Offline" locally**
- **Cause**: Backend service not running
- **Solution**: Run `python3 google_drive_backend.py`

**Files Download Instead of Upload**
- **Cause**: No authentication or service available
- **Solution**: Check status symbol and authenticate if needed

## 🎉 **Benefits & Use Cases**

### **Regulatory Compliance**
- ✅ **USP Standards**: Meets all USP 795, 797, and 800 requirements
- ✅ **Documentation**: Generates regulatory-ready reports
- ✅ **Audit Trail**: Complete historical tracking
- ✅ **Professional Format**: Clean, easy-to-read documentation

### **Operational Efficiency**
- ✅ **Automation**: Reduces manual documentation overhead
- ✅ **Real-time Alerts**: Immediate notification of compliance issues
- ✅ **Cloud Storage**: Automatic backup and accessibility
- ✅ **Multi-device**: Works on any device with a browser

### **Cost Effectiveness**
- ✅ **No Software Licensing**: Web-based, no installation required
- ✅ **Scalable**: Easy to deploy across multiple locations
- ✅ **Low Maintenance**: Automatic updates via GitHub Pages
- ✅ **Free Hosting**: GitHub Pages provides free, reliable hosting

## 🔄 **Version History**

### **Version 2.2 (Current)**
- ✅ **GitHub Pages Integration**: Direct Google API support for production deployment
- ✅ **Environment Detection**: Automatically detects local vs GitHub Pages deployment
- ✅ **Dual Integration**: Backend service (local) + Direct Google API (GitHub Pages)
- ✅ **Click Authentication**: Simple click-to-authenticate flow on GitHub Pages
- ✅ **Enhanced Status Indicators**: Clear visual feedback with tooltips and click actions
- ✅ **GitHub Actions Deployment**: Automatic deployment to GitHub Pages
- ✅ **Repository Cleanup**: Streamlined to essential files only

### **Previous Versions**
- **v2.1**: Backend-only version with enhanced status symbols
- **v2.0**: Google Drive backend integration
- **v1.0**: Initial release with basic compliance monitoring

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 **Acknowledgments**

- **USP Standards**: Based on United States Pharmacopeia compounding standards
- **Google Drive API**: For cloud storage integration
- **GitHub Pages**: For reliable, free hosting
- **jsPDF Library**: For client-side PDF generation

---

**🌍 Live Application**: [https://labreporttool.xyz](https://labreporttool.xyz)  
**📧 Support**: [GitHub Issues](https://github.com/Jared-T-Proctor-JTP34/LabReport/issues)  
**📚 Documentation**: [Setup Guide](GITHUB_GOOGLE_API_SETUP.md) | [Testing Guide](TESTING_GUIDE.md)  

**Ready for professional pharmacy compliance monitoring!** 🧪✨