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

## File Versions

### `Pharmacy_Compliance_GoogleDrive.html`
- **Google Drive Integration** - Direct uploads to specified folder
- **OAuth2 Authentication** - Secure Google Drive access
- **Cloud Storage** - Automatic backup to Google Drive
- **Setup Required** - Needs Google Cloud Console configuration

### `Pharmacy_Compliance_Stable.html`
- **Local File Downloads** - No external dependencies
- **Immediate Use** - Works out of the box
- **Offline Capable** - No internet connection required
- **Browser Downloads** - Files save to default download folder

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
2. **Select appropriate compounding area** tab
3. **Enter environmental readings** (temperature, humidity, pressure)
4. **Complete cleaning task checklist** as applicable
5. **Enter staff initials** for accountability
6. **Click "Get Report"** to record data and generate compliance report
7. **Access complete history** via collapsible history sections

## Technical Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Local Storage** - Data persists between sessions
- **Error Handling** - Robust error management and user feedback
- **Professional UI** - Clean, intuitive interface design
- **Compliance Validation** - Real-time USP standard checking
- **Export Capabilities** - PDF reports and CSV data export

## Browser Compatibility

- Chrome (Recommended)
- Firefox
- Safari
- Edge

## Setup for Google Drive Version

1. Create Google Cloud Console project
2. Enable Google Drive API
3. Create OAuth2 credentials
4. Replace placeholder values in HTML file
5. Configure authorized domains

## Data Security

- Local browser storage only
- No external data transmission (stable version)
- Secure OAuth2 authentication (Google Drive version)
- Session-based access control

## Regulatory Compliance

This application is designed to support compliance with:
- USP Chapter 795 (Non-Sterile Compounding)
- USP Chapter 797 (Sterile Compounding)  
- USP Chapter 800 (Hazardous Drug Compounding)

## Support

For technical support or feature requests, please create an issue in this repository.

---

**Version:** 2.0  
**Last Updated:** January 2025  
**License:** MIT