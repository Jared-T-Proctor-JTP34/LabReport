@echo off
echo ========================================
echo SETUP DOCUMENTS/LABREPORTS FOLDER
echo ========================================
echo.

echo 🔧 Setting up labreports folder in Documents...
echo.

REM Get the user's Documents folder path
set "DOCS_PATH=%USERPROFILE%\Documents"
set "LABREPORTS_PATH=%DOCS_PATH%\labreports"

echo 📁 Documents folder: %DOCS_PATH%
echo 📁 Target folder: %LABREPORTS_PATH%
echo.

REM Create the labreports folder if it doesn't exist
if not exist "%LABREPORTS_PATH%" (
    echo 📂 Creating labreports folder...
    mkdir "%LABREPORTS_PATH%"
    echo ✅ Created: %LABREPORTS_PATH%
) else (
    echo ✅ Folder already exists: %LABREPORTS_PATH%
)

echo.
echo 🔑 Checking for service account key...

REM Check if service account key exists in current directory
if exist "service-account-key.json" (
    echo ✅ Found service-account-key.json in current directory
    
    REM Check if it already exists in target location
    if exist "%LABREPORTS_PATH%\service-account-key.json" (
        echo ⚠️ Service account key already exists in Documents\labreports
        set /p overwrite="Overwrite existing key? (y/N): "
        if /i "!overwrite!"=="y" (
            copy "service-account-key.json" "%LABREPORTS_PATH%\" >nul
            echo ✅ Service account key copied to Documents\labreports
        ) else (
            echo 📋 Keeping existing key in Documents\labreports
        )
    ) else (
        copy "service-account-key.json" "%LABREPORTS_PATH%\" >nul
        echo ✅ Service account key copied to Documents\labreports
    )
) else (
    echo ❌ service-account-key.json not found in current directory
    echo 📋 Please place your service account key in: %LABREPORTS_PATH%
)

echo.
echo 📋 FOLDER STRUCTURE CREATED:
echo %LABREPORTS_PATH%\
echo ├── service-account-key.json  (Google service account)
echo └── (future lab report files will be stored here)
echo.

echo 🎯 BACKEND CONFIGURATION:
echo ✅ Backend will now look for service account key at:
echo    %LABREPORTS_PATH%\service-account-key.json
echo.
echo ✅ This provides:
echo    - Centralized location for lab reports
echo    - Easy access from File Explorer
echo    - Organized document management
echo    - Consistent path across all scripts
echo.

echo 🚀 NEXT STEPS:
echo 1. Verify key location: %LABREPORTS_PATH%\service-account-key.json
echo 2. Run: python BACKEND_SERVICE_ACCOUNT.py
echo 3. Backend will automatically find the key in Documents\labreports
echo.

echo Opening Documents\labreports folder...
explorer "%LABREPORTS_PATH%"

echo.
echo ========================================
echo Setup complete! 🎉
echo ========================================
pause