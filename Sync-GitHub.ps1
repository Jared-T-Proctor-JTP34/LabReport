# GitHub Repository Sync - PowerShell Script
# Pharmacy Compounding Compliance Log - Google Verification Update

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub Repository Sync" -ForegroundColor Yellow
Write-Host "Pharmacy Compounding Compliance Log" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport.git" -ForegroundColor Green
Write-Host "User: Jared T Proctor (jared9689098@gmail.com)" -ForegroundColor Green
Write-Host ""

# Check if git is available
try {
    $gitVersion = git --version
    Write-Host "Git Version: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git not found. Please install Git or add it to PATH." -ForegroundColor Red
    Write-Host "Download from: https://git-scm.com/download/windows" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 1: Checking Git Status..." -ForegroundColor Yellow
git status

Write-Host ""
Write-Host "Step 2: Adding all new and modified files..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "Step 3: Showing what will be committed..." -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "Step 4: Committing changes..." -ForegroundColor Yellow

$commitMessage = @"
Complete Google Verification Setup - Add Privacy Policy, Terms, Contact Pages

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

Version: 2.2 - Google Verification Ready
"@

git commit -m $commitMessage

Write-Host ""
Write-Host "Step 5: Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Sync Complete! ✅" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Your changes have been pushed to:" -ForegroundColor Green
Write-Host "https://github.com/Jared-T-Proctor-JTP34/LabReport" -ForegroundColor Blue
Write-Host ""

Write-Host "🌐 GitHub Pages will auto-deploy to:" -ForegroundColor Green
Write-Host "https://jared-t-proctor-jtp34.github.io/LabReport/" -ForegroundColor Blue
Write-Host ""

Write-Host "🏠 Your domain will show updates at:" -ForegroundColor Green
Write-Host "https://labreporttool.xyz" -ForegroundColor Blue
Write-Host ""

Write-Host "📋 CRITICAL NEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Configure OAuth consent screen in Google Cloud Console" -ForegroundColor White
Write-Host "2. Test the application at https://labreporttool.xyz" -ForegroundColor White
Write-Host "3. Verify Google Drive integration works" -ForegroundColor White
Write-Host ""

Write-Host "📚 Documentation Created:" -ForegroundColor Yellow
Write-Host "- Setup Guide: GOOGLE_CLOUD_CONSOLE_SETUP.md" -ForegroundColor White
Write-Host "- Completion Guide: GOOGLE_VERIFICATION_COMPLETE.md" -ForegroundColor White
Write-Host "- Summary: SETUP_COMPLETION_SUMMARY.md" -ForegroundColor White
Write-Host ""

Write-Host "🎯 Files Added/Updated:" -ForegroundColor Yellow
Write-Host "✅ privacy-policy.html - Professional privacy policy" -ForegroundColor Green
Write-Host "✅ terms-of-service.html - Comprehensive terms of service" -ForegroundColor Green
Write-Host "✅ contact.html - Contact and support information" -ForegroundColor Green
Write-Host "✅ Enhanced landing page and application branding" -ForegroundColor Green
Write-Host "✅ Complete Google verification documentation" -ForegroundColor Green
Write-Host ""

Write-Host "🚀 Ready for Google Cloud Console configuration!" -ForegroundColor Magenta
Write-Host ""

Read-Host "Press Enter to exit"