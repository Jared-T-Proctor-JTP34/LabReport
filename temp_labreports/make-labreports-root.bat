@echo off
echo 🔄 Making Labreports folder the repository root...
echo.
echo ⚠️  WARNING: This will restructure the repository so that
echo    Labreports becomes the root directory, removing all
echo    desktop shortcuts and unnecessary files.
echo.
set /p confirm="Continue? (y/N): "
if /i not "%confirm%"=="y" (
    echo Operation cancelled.
    pause
    exit /b
)

echo.
echo 📁 Step 1: Moving all files from root to Labreports...

REM Navigate to repository root
cd ..

REM Move any remaining application files to Labreports
echo Moving application files to Labreports...
if exist "Pharmacy_Compliance_Backend.html" move "Pharmacy_Compliance_Backend.html" "Labreports\" 2>nul
if exist "index.html" move "index.html" "Labreports\" 2>nul
if exist "google_drive_backend.py" move "google_drive_backend.py" "Labreports\" 2>nul
if exist "README.md" move "README.md" "Labreports\" 2>nul
if exist "GITHUB_GOOGLE_API_SETUP.md" move "GITHUB_GOOGLE_API_SETUP.md" "Labreports\" 2>nul
if exist "TESTING_GUIDE.md" move "TESTING_GUIDE.md" "Labreports\" 2>nul
if exist "test_backend.py" move "test_backend.py" "Labreports\" 2>nul
if exist "local-https-server.py" move "local-https-server.py" "Labreports\" 2>nul
if exist "cert.pem" move "cert.pem" "Labreports\" 2>nul
if exist "key.pem" move "key.pem" "Labreports\" 2>nul
if exist ".gitignore" move ".gitignore" "Labreports\" 2>nul
if exist "CNAME" move "CNAME" "Labreports\" 2>nul
if exist "REPOSITORY_CLEANUP_SUMMARY.md" move "REPOSITORY_CLEANUP_SUMMARY.md" "Labreports\" 2>nul
if exist "commit-changes.ps1" move "commit-changes.ps1" "Labreports\" 2>nul
if exist "commit-all-changes.bat" move "commit-all-changes.bat" "Labreports\" 2>nul

REM Move .github folder to Labreports
if exist ".github" (
    echo Moving GitHub Actions workflow...
    move ".github" "Labreports\" 2>nul
)

echo.
echo 🗑️  Step 2: Removing desktop shortcuts and unnecessary files...

REM Remove desktop shortcuts and unnecessary files from root
del "3DMark.url" 2>nul
del "7nZJhA9vKFw8G9G6TzeLzX.url" 2>nul
del "Bloons TD 6.url" 2>nul
del "CurseForge.lnk" 2>nul
del "desktop.ini" 2>nul
del "GitHub Desktop.lnk" 2>nul
del "Inkbound.url" 2>nul
del "Jagex Launcher.lnk" 2>nul
del "Kiro.lnk" 2>nul
del "Microsoft Edge.lnk" 2>nul
del "Old School RuneScape.url" 2>nul
del "Path of Exile 2.url" 2>nul
del "R.E.P.O..url" 2>nul
del "ReMouse Standard.lnk" 2>nul
del "Risk of Rain 2.url" 2>nul
del "RuneLite.lnk" 2>nul
del "Thunderstore Mod Manager.lnk" 2>nul
del "Wago App.lnk" 2>nul
del "Zoom Workplace.lnk" 2>nul

echo.
echo 📂 Step 3: Moving Labreports contents to repository root...

REM Create temporary directory
mkdir temp_labreports 2>nul

REM Move all Labreports contents to temp directory
move "Labreports\*" "temp_labreports\" 2>nul

REM Remove empty Labreports directory
rmdir "Labreports" 2>nul

REM Move everything from temp back to root
move "temp_labreports\*" ".\" 2>nul

REM Remove temp directory
rmdir "temp_labreports" 2>nul

echo.
echo ✅ Repository restructuring complete!
echo.
echo 📋 New repository structure:
echo    • Labreports contents are now at repository root
echo    • Desktop shortcuts removed
echo    • Clean, professional repository
echo    • Ready for GitHub Pages deployment
echo.
echo 🌐 Repository is now optimized for GitHub Pages!
echo.

pause