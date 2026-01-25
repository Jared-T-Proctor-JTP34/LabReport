@echo off
echo 🧹 Restructuring Repository - Moving Labreports to Root...
echo.
echo ⚠️  WARNING: This will move all Labreports files to repository root
echo    and remove all desktop shortcuts from the repository.
echo.
set /p confirm="Continue? (y/N): "
if /i not "%confirm%"=="y" (
    echo Operation cancelled.
    pause
    exit /b
)

echo.
echo 📁 Step 1: Moving Labreports contents to repository root...

REM Navigate to repository root
cd ..

REM Move all files from Labreports to root (except this script)
echo Moving application files...
move "Labreports\.github" ".\" 2>nul
move "Labreports\.gitignore" ".\" 2>nul
move "Labreports\CNAME" ".\" 2>nul
move "Labreports\index.html" ".\" 2>nul
move "Labreports\Pharmacy_Compliance_Backend.html" ".\" 2>nul
move "Labreports\google_drive_backend.py" ".\" 2>nul
move "Labreports\README.md" ".\" 2>nul
move "Labreports\GITHUB_GOOGLE_API_SETUP.md" ".\" 2>nul
move "Labreports\TESTING_GUIDE.md" ".\" 2>nul
move "Labreports\test_backend.py" ".\" 2>nul
move "Labreports\local-https-server.py" ".\" 2>nul
move "Labreports\cert.pem" ".\" 2>nul
move "Labreports\key.pem" ".\" 2>nul
move "Labreports\commit-changes.ps1" ".\" 2>nul
move "Labreports\commit-all-changes.bat" ".\" 2>nul
move "Labreports\REPOSITORY_CLEANUP_SUMMARY.md" ".\" 2>nul

echo.
echo 🗑️  Step 2: Removing desktop shortcuts and unnecessary files...

REM Remove desktop shortcuts and unnecessary files
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
echo 📂 Step 3: Removing empty Labreports folder...
rmdir "Labreports" 2>nul

echo.
echo ✅ Repository restructuring complete!
echo.
echo 📋 New repository structure:
echo    • All application files moved to repository root
echo    • Desktop shortcuts removed
echo    • Clean, professional repository structure
echo.
echo 🌐 Ready for GitHub commit and deployment!
echo.

pause