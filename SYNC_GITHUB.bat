@echo off
echo ========================================
echo GitHub Repository Sync - Pharmacy Compliance Log
echo ========================================
echo.

echo Current Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport.git
echo User: Jared T Proctor (jared9689098@gmail.com)
echo.

echo Step 1: Checking Git Status...
git status
echo.

echo Step 2: Adding all new and modified files...
git add .
echo.

echo Step 3: Showing what will be committed...
git status --short
echo.

echo Step 4: Committing changes...
git commit -m "Complete Google Verification Setup - Add Privacy Policy, Terms, Contact Pages

✅ MAJOR UPDATE: Google Verification Compliance
- Added privacy-policy.html with comprehensive data handling details
- Added terms-of-service.html with professional USP compliance terms  
- Added contact.html with support resources and GitHub links
- Enhanced index.html landing page for professional presentation
- Fixed app name consistency to 'Pharmacy Compounding Compliance Log'
- Updated Pharmacy_Compliance_Backend.html with enhanced descriptions
- Created GOOGLE_VERIFICATION_COMPLETE.md with complete setup guide
- Created SETUP_COMPLETION_SUMMARY.md with next steps

🔧 TECHNICAL IMPROVEMENTS:
- Updated Google Identity Services integration (no deprecated APIs)
- Enhanced OAuth consent screen compatibility
- Improved error handling and user feedback
- Professional branding and presentation throughout

📋 GOOGLE CLOUD CONSOLE READY:
- All required pages created for OAuth consent screen
- Privacy Policy URL: https://labreporttool.xyz/privacy-policy.html
- Terms of Service URL: https://labreporttool.xyz/terms-of-service.html
- Professional app description and feature explanations
- Authorized domains configuration documented

🎯 NEXT STEP: Configure OAuth consent screen in Google Cloud Console
- This resolves the idpiframe_initialization_failed error
- Enables professional Google Drive integration
- Completes the verification process for labreporttool.xyz

Version: 2.2 - Google Verification Ready"
echo.

echo Step 5: Pushing to GitHub...
git push origin main
echo.

echo ========================================
echo Sync Complete! 
echo ========================================
echo.
echo Your changes have been pushed to:
echo https://github.com/Jared-T-Proctor-JTP34/LabReport
echo.
echo Next Steps:
echo 1. Configure OAuth consent screen in Google Cloud Console
echo 2. Test the application at https://labreporttool.xyz
echo 3. Verify Google Drive integration works
echo.
echo Documentation:
echo - Setup Guide: GOOGLE_CLOUD_CONSOLE_SETUP.md
echo - Completion Guide: GOOGLE_VERIFICATION_COMPLETE.md
echo - Summary: SETUP_COMPLETION_SUMMARY.md
echo.
pause