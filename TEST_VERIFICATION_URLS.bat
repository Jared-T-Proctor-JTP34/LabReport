@echo off
echo ========================================
echo Google Verification File Test
echo ========================================
echo.

echo Testing Google verification file accessibility...
echo.

echo File: google953dbda9f727c706.html
echo Expected content: google-site-verification: google953dbda9f727c706.html
echo.

echo 🌐 Testing URLs:
echo.

echo 1. Custom Domain:
echo https://labreporttool.xyz/google953dbda9f727c706.html
start "" "https://labreporttool.xyz/google953dbda9f727c706.html"
echo.

echo 2. GitHub Pages:
echo https://jared-t-proctor-jtp34.github.io/LabReport/google953dbda9f727c706.html
start "" "https://jared-t-proctor-jtp34.github.io/LabReport/google953dbda9f727c706.html"
echo.

echo 3. Main Website:
echo https://labreporttool.xyz
start "" "https://labreporttool.xyz"
echo.

echo ========================================
echo Verification Instructions
echo ========================================
echo.
echo ✅ WHAT TO CHECK:
echo 1. Both verification URLs should load and show the verification string
echo 2. Main website should load properly
echo 3. If files load correctly, proceed to Google Search Console
echo.
echo 🔧 GOOGLE SEARCH CONSOLE STEPS:
echo 1. Go to: https://search.google.com/search-console/
echo 2. Click "Add Property"
echo 3. Choose "URL prefix"
echo 4. Enter: https://labreporttool.xyz
echo 5. Select "HTML file" verification method
echo 6. Confirm filename: google953dbda9f727c706.html
echo 7. Click "Verify"
echo.
echo 📋 AFTER VERIFICATION SUCCESS:
echo 1. Update OAuth consent screen with labreporttool.xyz URLs
echo 2. Test Google Drive authentication
echo 3. Verify complete application functionality
echo.
echo ❌ IF VERIFICATION FAILS:
echo 1. Wait 5-10 minutes and try again
echo 2. Clear browser cache and retry
echo 3. Try the meta tag method instead
echo 4. Check that files are accessible at the URLs above
echo.
pause