@echo off
echo ========================================
echo Add Google HTML Verification File
echo ========================================
echo.

echo This script will help you copy the Google verification HTML file
echo from your desktop to the repository and sync it to GitHub.
echo.

echo Step 1: Locate your Google verification file
echo The file should be named something like:
echo - google[verification-code].html
echo - googleabcdef123456.html
echo - Similar pattern with your verification code
echo.

set /p filename="Enter the exact filename of your Google verification file: "

if "%filename%"=="" (
    echo Error: No filename provided
    pause
    exit /b 1
)

echo.
echo Step 2: Copy file from desktop
echo Copying %filename% from desktop to repository...

if exist "%USERPROFILE%\Desktop\%filename%" (
    copy "%USERPROFILE%\Desktop\%filename%" "%~dp0%filename%"
    echo ✅ File copied successfully from Desktop
) else if exist "%USERPROFILE%\OneDrive\Desktop\%filename%" (
    copy "%USERPROFILE%\OneDrive\Desktop\%filename%" "%~dp0%filename%"
    echo ✅ File copied successfully from OneDrive Desktop
) else (
    echo ❌ File not found on Desktop or OneDrive Desktop
    echo.
    echo Please manually copy the file to this directory:
    echo %~dp0
    echo.
    echo Then press any key to continue...
    pause
)

echo.
echo Step 3: Verify file exists in repository
if exist "%~dp0%filename%" (
    echo ✅ Verification file found: %filename%
    echo File contents:
    type "%~dp0%filename%"
    echo.
) else (
    echo ❌ Verification file not found in repository
    echo Please manually copy %filename% to this directory and run the script again
    pause
    exit /b 1
)

echo.
echo Step 4: Add to Git and push to GitHub
echo Adding %filename% to Git...
git add "%filename%"

echo.
echo Committing changes...
git commit -m "Add Google HTML verification file: %filename%

✅ Domain Verification Setup
- Added Google HTML verification file for labreporttool.xyz
- File: %filename%
- This enables domain ownership verification in Google Search Console
- Required for OAuth consent screen configuration with custom domain

🎯 Next Steps:
1. Verify domain in Google Search Console
2. Update OAuth consent screen with labreporttool.xyz URLs
3. Test Google Drive integration with verified domain"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo Google Verification File Added! ✅
echo ========================================
echo.
echo File added: %filename%
echo Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
echo.
echo The file will be accessible at:
echo https://labreporttool.xyz/%filename%
echo https://jared-t-proctor-jtp34.github.io/LabReport/%filename%
echo.
echo 🎯 NEXT STEPS:
echo 1. Wait 2-3 minutes for GitHub Pages to deploy
echo 2. Go to Google Search Console: https://search.google.com/search-console/
echo 3. Add property: https://labreporttool.xyz
echo 4. Choose "HTML file" verification method
echo 5. Confirm the filename matches: %filename%
echo 6. Click "Verify"
echo.
echo 📋 After successful verification:
echo 1. Update OAuth consent screen with labreporttool.xyz URLs
echo 2. Test Google Drive authentication
echo 3. Verify application works with custom domain
echo.
pause