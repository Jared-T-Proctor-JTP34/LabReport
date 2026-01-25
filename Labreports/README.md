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
- **Backend Service**: No user authentication required - all uploads handled server-side
- Automatic PDF uploads to designated Google Drive folder
- Fallback to local download if service unavailable
- Clean status indicator shows connection status

## 🏗️ Architecture

### **Frontend Application**
- `Pharmacy_Compliance_Backend.html` - Main application with backend service integration
- `index.html` - Entry point that redirects to the main application

### **Backend Service**
- `google_drive_backend.py` - Python backend for Google Drive uploads
- Handles authentication and file uploads server-side
- CORS-enabled for frontend integration
- Automatic local backup if Google Drive unavailable

### **Development Tools**
- Local HTTPS server setup for testing Google APIs
- Comprehensive testing suite for Google Drive connectivity
- SSL certificate generation for local development
- Multiple diagnostic and verification tools

## 🚀 Quick Start

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
├── Pharmacy_Compliance_Backend.html      # Main application
├── index.html                            # Entry point (redirects to main app)
├── google_drive_backend.py               # Backend service
├── local-https-server.py                 # Local HTTPS server
├── test_backend.py                       # Backend testing suite
├── GOOGLE_DRIVE_PERMANENT_SETUP.md       # Setup documentation
├── TESTING_GUIDE.md                      # Testing instructions
├── DNS_CONFIGURATION.md                  # Domain setup guide
└── FOLDER_README.md                      # Folder organization guide
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

### **Production Deployment**
1. Deploy to `labreporttool.xyz` domain
2. Configure DNS settings (included in repository)
3. Set up Google Cloud Console for production domain
4. Deploy backend service to cloud provider

### **Security Considerations**
- HTTPS required for Google API integration
- Secure credential management
- CORS configuration for cross-origin requests
- Session management and automatic logout

## 📞 Support & Documentation

- **Setup Guide**: `GOOGLE_DRIVE_PERMANENT_SETUP.md`
- **Testing Guide**: `TESTING_GUIDE.md`
- **DNS Configuration**: `DNS_CONFIGURATION.md`
- **Troubleshooting**: `GOOGLE_DRIVE_TROUBLESHOOTING.md`

## 🎉 Benefits

- **Regulatory Compliance**: Meets USP standards for pharmaceutical compounding
- **Automation**: Reduces manual documentation overhead
- **Accessibility**: Web-based, works on any device with a browser
- **Reliability**: Multiple fallback mechanisms ensure data is never lost
- **Professional**: Generates regulatory-ready documentation
- **Scalable**: Easy to deploy and maintain across multiple locations
- **No Authentication Required**: Backend service option eliminates user authentication complexity

## 🔄 Recent Updates (v2.1)

- ✅ Simplified to single backend-only version
- ✅ Enhanced status symbol showing Google Drive connection status
- ✅ Removed OAuth complexity - all authentication handled server-side
- ✅ Clean, professional status indicator (✅ connected, ⚠️ offline, ❌ error)
- ✅ Streamlined documentation and file structure
- ✅ Improved user experience with clear visual feedback

---

**Version**: 2.1  
**Last Updated**: January 2026  
**License**: MIT  
**Domain**: https://labreporttool.xyz  
**Repository**: https://github.com/Jared-T-Proctor-JTP34/LabReport