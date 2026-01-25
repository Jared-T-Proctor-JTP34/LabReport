# Pharmacy Compounding Compliance Log

A comprehensive web-based application for tracking environmental compliance in pharmaceutical compounding areas according to USP standards.

## Features

### 🧪 **Multi-Area Monitoring**
- **USP 795** - Non-Sterile Compounding Area
- **USP 797** - Sterile Compounding Area  
- **USP 800** - Hazardous Drug Compounding Area

### 📊 **Compliance Tracking**
- Temperature monitoring (68-77°F)
- Humidity monitoring (≤60% RH)
- Air pressure monitoring (797 & 800 areas)
- Real-time compliance validation
- Automated timestamp recording

### 🧽 **Cleaning Task Management**
- Daily cleaning task checklists
- Area-specific cleaning requirements
- Integrated task completion tracking
- Cleaning compliance reporting

### 📈 **Comprehensive Reporting**
- Professional PDF reports
- Complete historical data access
- Compliance statistics dashboard
- Exportable data formats

## Application

### `Pharmacy_Compliance_GoogleDrive.html`
- **Google Drive Integration** - Direct uploads to specified folder
- **OAuth2 Authentication** - Secure Google Drive access
- **Cloud Storage** - Automatic backup to Google Drive
- **Fallback Mode** - Downloads locally if Google Drive not configured
- **Setup Instructions** - Includes Google Cloud Console configuration guide

## Login Credentials

| Username | Password | Role |
|----------|----------|------|
| admin | pharmacy123 | Administrator |
| pharmacist | compound456 | Pharmacist |
| tech | sterile789 | Technician |

## USP Compliance Standards

### Temperature & Humidity (All Areas)
- **Temperature Range:** 68-77°F (20-25°C)
- **Humidity Limit:** ≤60% RH
- **Monitoring Frequency:** Daily or per compounding session

### Air Pressure Requirements
- **USP 797 (Sterile):** +0.01 to +0.05 inches WC (positive pressure)
- **USP 800 (Hazardous):** -0.01 to -0.05 inches WC (negative pressure)
- **USP 795 (Non-Sterile):** No pressure requirements

## Usage Instructions

1. **Login** with provided credentials
2. **Connect to Google Drive** (optional - will download locally if not configured)
3. **Select appropriate compounding area** tab
4. **Enter environmental readings** (temperature, humidity, pressure)
5. **Complete cleaning task checklist** as applicable
6. **Enter staff initials** for accountability
7. **Click "Get Report"** to record data and generate compliance report
8. **Access complete history** via collapsible history sections

## Google Drive Setup (Optional)

The application works without Google Drive setup but will download files locally instead. To enable Google Drive integration:

1. Create Google Cloud Console project
2. Enable Google Drive API
3. Create OAuth2 credentials
4. Replace placeholder values in HTML file
5. Configure authorized domains

See the application's built-in setup instructions for detailed steps.

## Technical Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Local Storage** - Data persists between sessions
- **Google Drive Integration** - Cloud backup and report storage
- **Error Handling** - Robust error management and user feedback
- **Professional UI** - Clean, intuitive interface design
- **Compliance Validation** - Real-time USP standard checking
- **PDF Reports** - Professional compliance documentation
- **OAuth2 Security** - Secure Google Drive authentication

## Browser Compatibility

- Chrome (Recommended)
- Firefox
- Safari
- Edge

## Data Security

- Local browser storage for session data
- Secure OAuth2 authentication for Google Drive
- Session-based access control
- Optional cloud backup with user consent

## Regulatory Compliance
- USP Chapter 795 (Non-Sterile Compounding)
- USP Chapter 797 (Sterile Compounding)  
- USP Chapter 800 (Hazardous Drug Compounding)

## Support

For technical support or feature requests, please create an issue in this repository.

---

**Version:** 2.0  
**Last Updated:** January 2025  
**License:** MIT