@echo off
echo ========================================
echo Cleanup Old Unnecessary Files
echo ========================================
echo.

echo This script will remove old files that are no longer needed
echo after implementing the service account integration.
echo.

echo Files to be removed:
echo.

REM List files that will be removed
echo ❌ Old OAuth/API files:
if exist "IMMEDIATE_OAUTH_FIX.md" echo   - IMMEDIATE_OAUTH_FIX.md
if exist "QUICK_OAUTH_SETUP.md" echo   - QUICK_OAUTH_SETUP.md
if exist "FIX_GOOGLE_DRIVE_UPLOAD.md" echo   - FIX_GOOGLE_DRIVE_UPLOAD.md
if exist "GOOGLE_DRIVE_FIX.md" echo   - GOOGLE_DRIVE_FIX.md
if exist "GOOGLE_DRIVE_TROUBLESHOOTING.md" echo   - GOOGLE_DRIVE_TROUBLESHOOTING.md

echo.
echo ❌ Old backend files:
if exist "google_drive_backend.py" echo   - google_drive_backend.py
if exist "test_backend.py" echo   - test_backend.py
if exist "local-https-server.py" echo   - local-https-server.py

echo.
echo ❌ Old verification files:
if exist "ADD_GOOGLE_VERIFICATION_FILE.md" echo   - ADD_GOOGLE_VERIFICATION_FILE.md
if exist "Add-GoogleVerificationFile.ps1" echo   - Add-GoogleVerificationFile.ps1
if exist "TEST_VERIFICATION_URLS.bat" echo   - TEST_VERIFICATION_URLS.bat
if exist "VERIFY_GOOGLE_DOMAIN.md" echo   - VERIFY_GOOGLE_DOMAIN.md

echo.
echo ❌ Old setup/transition files:
if exist "DOMAIN_TRANSITION_CHECKLIST.md" echo   - DOMAIN_TRANSITION_CHECKLIST.md
if exist "FORCE_CACHE_REFRESH.md" echo   - FORCE_CACHE_REFRESH.md
if exist "CLEAR_BROWSER_CACHE.md" echo   - CLEAR_BROWSER_CACHE.md
if exist "GITHUB_GOOGLE_API_SETUP.md" echo   - GITHUB_GOOGLE_API_SETUP.md
if exist "GITHUB_SYNC_MANUAL.md" echo   - GITHUB_SYNC_MANUAL.md
if exist "REPOSITORY_CLEANUP_SUMMARY.md" echo   - REPOSITORY_CLEANUP_SUMMARY.md
if exist "SETUP_COMPLETION_SUMMARY.md" echo   - SETUP_COMPLETION_SUMMARY.md

echo.
echo ❌ Duplicate/old documentation:
if exist "COMPLETE_SERVICE_ACCOUNT_SETUP.md" echo   - COMPLETE_SERVICE_ACCOUNT_SETUP.md
if exist "MANUAL_FILE_COPY_GUIDE.md" echo   - MANUAL_FILE_COPY_GUIDE.md
if exist "TESTING_GUIDE.md" echo   - TESTING_GUIDE.md

echo.
set /p confirm="Do you want to proceed with cleanup? (y/N): "

if /i "%confirm%"=="y" (
    echo.
    echo Removing old files...
    
    REM Remove OAuth/API files
    if exist "IMMEDIATE_OAUTH_FIX.md" del "IMMEDIATE_OAUTH_FIX.md" && echo ✅ Removed IMMEDIATE_OAUTH_FIX.md
    if exist "QUICK_OAUTH_SETUP.md" del "QUICK_OAUTH_SETUP.md" && echo ✅ Removed QUICK_OAUTH_SETUP.md
    if exist "FIX_GOOGLE_DRIVE_UPLOAD.md" del "FIX_GOOGLE_DRIVE_UPLOAD.md" && echo ✅ Removed FIX_GOOGLE_DRIVE_UPLOAD.md
    if exist "GOOGLE_DRIVE_FIX.md" del "GOOGLE_DRIVE_FIX.md" && echo ✅ Removed GOOGLE_DRIVE_FIX.md
    if exist "GOOGLE_DRIVE_TROUBLESHOOTING.md" del "GOOGLE_DRIVE_TROUBLESHOOTING.md" && echo ✅ Removed GOOGLE_DRIVE_TROUBLESHOOTING.md
    
    REM Remove old backend files
    if exist "google_drive_backend.py" del "google_drive_backend.py" && echo ✅ Removed google_drive_backend.py
    if exist "test_backend.py" del "test_backend.py" && echo ✅ Removed test_backend.py
    if exist "local-https-server.py" del "local-https-server.py" && echo ✅ Removed local-https-server.py
    
    REM Remove old verification files
    if exist "ADD_GOOGLE_VERIFICATION_FILE.md" del "ADD_GOOGLE_VERIFICATION_FILE.md" && echo ✅ Removed ADD_GOOGLE_VERIFICATION_FILE.md
    if exist "Add-GoogleVerificationFile.ps1" del "Add-GoogleVerificationFile.ps1" && echo ✅ Removed Add-GoogleVerificationFile.ps1
    if exist "TEST_VERIFICATION_URLS.bat" del "TEST_VERIFICATION_URLS.bat" && echo ✅ Removed TEST_VERIFICATION_URLS.bat
    if exist "VERIFY_GOOGLE_DOMAIN.md" del "VERIFY_GOOGLE_DOMAIN.md" && echo ✅ Removed VERIFY_GOOGLE_DOMAIN.md
    
    REM Remove old setup files
    if exist "DOMAIN_TRANSITION_CHECKLIST.md" del "DOMAIN_TRANSITION_CHECKLIST.md" && echo ✅ Removed DOMAIN_TRANSITION_CHECKLIST.md
    if exist "FORCE_CACHE_REFRESH.md" del "FORCE_CACHE_REFRESH.md" && echo ✅ Removed FORCE_CACHE_REFRESH.md
    if exist "CLEAR_BROWSER_CACHE.md" del "CLEAR_BROWSER_CACHE.md" && echo ✅ Removed CLEAR_BROWSER_CACHE.md
    if exist "GITHUB_GOOGLE_API_SETUP.md" del "GITHUB_GOOGLE_API_SETUP.md" && echo ✅ Removed GITHUB_GOOGLE_API_SETUP.md
    if exist "GITHUB_SYNC_MANUAL.md" del "GITHUB_SYNC_MANUAL.md" && echo ✅ Removed GITHUB_SYNC_MANUAL.md
    if exist "REPOSITORY_CLEANUP_SUMMARY.md" del "REPOSITORY_CLEANUP_SUMMARY.md" && echo ✅ Removed REPOSITORY_CLEANUP_SUMMARY.md
    if exist "SETUP_COMPLETION_SUMMARY.md" del "SETUP_COMPLETION_SUMMARY.md" && echo ✅ Removed SETUP_COMPLETION_SUMMARY.md
    
    REM Remove duplicate documentation
    if exist "COMPLETE_SERVICE_ACCOUNT_SETUP.md" del "COMPLETE_SERVICE_ACCOUNT_SETUP.md" && echo ✅ Removed COMPLETE_SERVICE_ACCOUNT_SETUP.md
    if exist "MANUAL_FILE_COPY_GUIDE.md" del "MANUAL_FILE_COPY_GUIDE.md" && echo ✅ Removed MANUAL_FILE_COPY_GUIDE.md
    if exist "TESTING_GUIDE.md" del "TESTING_GUIDE.md" && echo ✅ Removed TESTING_GUIDE.md
    
    echo.
    echo ========================================
    echo Cleanup Complete! ✅
    echo ========================================
    echo.
    echo Remaining essential files:
    echo ✅ BACKEND_SERVICE_ACCOUNT.py - Main backend service
    echo ✅ test_google_drive_connectivity.py - Connectivity testing
    echo ✅ SERVICE_ACCOUNT_COMPLETE_SETUP.md - Setup guide
    echo ✅ SERVICE_ACCOUNT_SETUP_GUIDE.md - Detailed instructions
    echo ✅ SETUP_DEFAULT_GOOGLE_AUTH.md - Authentication overview
    echo ✅ ADD_SERVICE_ACCOUNT_KEY.bat - JSON key setup
    echo ✅ Add-ServiceAccountKey.ps1 - PowerShell key setup
    echo ✅ MANUAL_JSON_SETUP.md - Manual setup guide
    echo ✅ SYNC_GITHUB.bat - Git synchronization
    echo ✅ Sync-GitHub.ps1 - PowerShell git sync
    echo.
    echo Your project is now clean and organized! 🎉
    
) else (
    echo.
    echo Cleanup cancelled. No files were removed.
)

echo.
pause