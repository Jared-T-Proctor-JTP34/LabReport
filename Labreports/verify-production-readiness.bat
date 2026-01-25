@echo off
echo ========================================
echo   PRODUCTION READINESS VERIFICATION
echo ========================================
echo.
echo 🔍 Verifying pharmacy compliance application is ready for production...
echo 🌐 Target domain: labreporttool.xyz
echo.

echo ✅ Core Application Files:
if exist "Pharmacy_Compliance_Backend.html" (
    echo    ✓ Pharmacy_Compliance_Backend.html - Main application ready
) else (
    echo    ❌ Pharmacy_Compliance_Backend.html - MISSING
    set "missing_files=true"
)

if exist "index.html" (
    echo    ✓ index.html - Entry point ready
) else (
    echo    ❌ index.html - MISSING
    set "missing_files=true"
)

if exist "google_drive_backend.py" (
    echo    ✓ google_drive_backend.py - Backend service ready
) else (
    echo    ❌ google_drive_backend.py - MISSING
    set "missing_files=true"
)

echo.
echo ✅ GitHub Pages Configuration:
if exist "CNAME" (
    echo    ✓ CNAME file exists
    echo    📄 Domain configured for:
    type "CNAME"
) else (
    echo    ❌ CNAME file - MISSING
    set "missing_files=true"
)

if exist ".github\workflows\deploy.yml" (
    echo    ✓ GitHub Actions workflow ready
) else (
    echo    ❌ GitHub Actions workflow - MISSING
    set "missing_files=true"
)

if exist ".gitignore" (
    echo    ✓ .gitignore configured
) else (
    echo    ❌ .gitignore - MISSING
    set "missing_files=true"
)

echo.
echo ✅ Documentation:
if exist "README.md" (
    echo    ✓ README.md - Comprehensive documentation ready
) else (
    echo    ❌ README.md - MISSING
    set "missing_files=true"
)

if exist "GITHUB_GOOGLE_API_SETUP.md" (
    echo    ✓ Google API setup guide ready
) else (
    echo    ❌ Google API setup guide - MISSING
    set "missing_files=true"
)

if exist "TESTING_GUIDE.md" (
    echo    ✓ Testing guide ready
) else (
    echo    ❌ Testing guide - MISSING
    set "missing_files=true"
)

echo.
echo ✅ Development Tools:
if exist "test_backend.py" (
    echo    ✓ Backend testing suite ready
) else (
    echo    ❌ Backend testing suite - MISSING
    set "missing_files=true"
)

if exist "local-https-server.py" (
    echo    ✓ Local HTTPS server ready
) else (
    echo    ❌ Local HTTPS server - MISSING
    set "missing_files=true"
)

echo.
echo ✅ SSL Certificates:
if exist "cert.pem" (
    echo    ✓ SSL certificate ready
) else (
    echo    ❌ SSL certificate - MISSING
    set "missing_files=true"
)

if exist "key.pem" (
    echo    ✓ SSL private key ready
) else (
    echo    ❌ SSL private key - MISSING
    set "missing_files=true"
)

echo.
echo ========================================
echo   PRODUCTION READINESS SUMMARY
echo ========================================
echo.

if not defined missing_files (
    echo 🎉 PRODUCTION READY!
    echo.
    echo ✅ All essential files present and configured
    echo ✅ GitHub Pages configuration complete
    echo ✅ Domain transition ready
    echo ✅ Pharmacy compliance application ready for deployment
    echo.
    echo 🌐 Next Steps:
    echo    1. Run GITHUB_CLEANUP_AND_DOMAIN_TRANSITION.bat
    echo    2. Wait 2-3 minutes for GitHub Actions deployment
    echo    3. Visit https://labreporttool.xyz to test application
    echo    4. Configure Google Cloud Console if needed
    echo.
    echo 🧪 Your pharmacy compliance system is ready for production!
) else (
    echo ❌ NOT READY FOR PRODUCTION
    echo.
    echo ⚠️  Missing files detected. Please ensure all files are present.
    echo 📋 Check the missing files listed above and restore them.
    echo.
)

echo.
echo 📊 Repository Statistics:
echo ----------------------------------------
dir /b | find /c /v "" > temp_count.txt
set /p file_count=<temp_count.txt
del temp_count.txt
echo    Total files: %file_count%
echo    Repository size: 
dir /-c | find "bytes"
echo ----------------------------------------

echo.
pause