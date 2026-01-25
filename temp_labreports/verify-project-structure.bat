@echo off
echo 🔍 Verifying Project Structure in Labreports Folder...
echo.

cd Labreports

echo ✅ Core Application Files:
if exist "Pharmacy_Compliance_Backend.html" (echo    ✓ Pharmacy_Compliance_Backend.html) else (echo    ✗ Pharmacy_Compliance_Backend.html - MISSING)
if exist "index.html" (echo    ✓ index.html) else (echo    ✗ index.html - MISSING)
if exist "google_drive_backend.py" (echo    ✓ google_drive_backend.py) else (echo    ✗ google_drive_backend.py - MISSING)

echo.
echo ✅ Documentation:
if exist "README.md" (echo    ✓ README.md) else (echo    ✗ README.md - MISSING)
if exist "GITHUB_GOOGLE_API_SETUP.md" (echo    ✓ GITHUB_GOOGLE_API_SETUP.md) else (echo    ✗ GITHUB_GOOGLE_API_SETUP.md - MISSING)
if exist "TESTING_GUIDE.md" (echo    ✓ TESTING_GUIDE.md) else (echo    ✗ TESTING_GUIDE.md - MISSING)

echo.
echo ✅ Development Tools:
if exist "test_backend.py" (echo    ✓ test_backend.py) else (echo    ✗ test_backend.py - MISSING)
if exist "local-https-server.py" (echo    ✓ local-https-server.py) else (echo    ✗ local-https-server.py - MISSING)

echo.
echo ✅ SSL Certificates:
if exist "cert.pem" (echo    ✓ cert.pem) else (echo    ✗ cert.pem - MISSING)
if exist "key.pem" (echo    ✓ key.pem) else (echo    ✗ key.pem - MISSING)

echo.
echo ✅ Configuration Files:
if exist ".gitignore" (echo    ✓ .gitignore) else (echo    ✗ .gitignore - MISSING)
if exist "CNAME" (echo    ✓ CNAME) else (echo    ✗ CNAME - MISSING)

echo.
echo ✅ GitHub Actions:
if exist ".github\workflows\deploy.yml" (echo    ✓ .github/workflows/deploy.yml) else (echo    ✗ .github/workflows/deploy.yml - MISSING)

echo.
echo 📊 Complete File List in Labreports:
dir /b

echo.
echo 🎯 Project Structure Verification Complete!

cd ..
pause