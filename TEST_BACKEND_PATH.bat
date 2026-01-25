@echo off
echo ========================================
echo BACKEND JSON KEY PATH TEST
echo ========================================
echo.

echo 🔍 Checking if JSON key is in same directory as backend script...
echo.

echo 📁 Current directory: %CD%
echo 📄 Backend script: BACKEND_SERVICE_ACCOUNT.py
echo 🔑 JSON key: service-account-key.json
echo.

if exist "BACKEND_SERVICE_ACCOUNT.py" (
    echo ✅ Backend script found
) else (
    echo ❌ Backend script missing
    goto :error
)

if exist "service-account-key.json" (
    echo ✅ JSON key found
) else (
    echo ❌ JSON key missing
    goto :error
)

echo.
echo 🧪 Running path test...
python TEST_JSON_PATH.py

if %ERRORLEVEL% EQU 0 (
    echo.
    echo 🎉 SUCCESS: Everything is properly configured!
    echo ✅ JSON key is in same directory as backend script
    echo ✅ Backend will find the service account key
    echo ✅ Ready to run: python BACKEND_SERVICE_ACCOUNT.py
) else (
    echo.
    echo ❌ Path test failed - check the output above
)

goto :end

:error
echo.
echo ❌ Missing required files
echo 📋 Make sure both files are in the same directory:
echo    - BACKEND_SERVICE_ACCOUNT.py
echo    - service-account-key.json

:end
echo.
pause