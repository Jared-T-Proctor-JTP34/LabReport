@echo off
setlocal enabledelayedexpansion

echo ========================================
echo MOVE PROJECT TO DOCUMENTS/LABREPORTS
echo ========================================
echo.

REM Get paths
set "CURRENT_DIR=%CD%"
set "DOCS_PATH=%USERPROFILE%\Documents"
set "TARGET_PATH=%DOCS_PATH%\labreports"

echo 📁 Current project location: %CURRENT_DIR%
echo 📁 Target location: %TARGET_PATH%
echo.

REM Create target directory if it doesn't exist
if not exist "%TARGET_PATH%" (
    echo 📂 Creating labreports folder in Documents...
    mkdir "%TARGET_PATH%"
    echo ✅ Created: %TARGET_PATH%
) else (
    echo ✅ Target folder exists: %TARGET_PATH%
)

echo.
echo ⚠️  WARNING: This will move your entire project to Documents\labreports
echo 📋 Files to be moved:
echo    - All Python scripts (backend, tests)
echo    - All documentation (.md files)
echo    - All configuration files (render.yaml, requirements.txt)
echo    - All HTML files (frontend)
echo    - Service account key
echo    - All batch scripts
echo.

set /p confirm="Continue with project move? (y/N): "
if /i not "%confirm%"=="y" (
    echo ❌ Move cancelled by user
    goto :end
)

echo.
echo 🚀 Starting project migration...
echo.

REM Create subdirectories in target
echo 📂 Creating project structure...
if not exist "%TARGET_PATH%\docs" mkdir "%TARGET_PATH%\docs"
if not exist "%TARGET_PATH%\scripts" mkdir "%TARGET_PATH%\scripts"
if not exist "%TARGET_PATH%\frontend" mkdir "%TARGET_PATH%\frontend"
if not exist "%TARGET_PATH%\config" mkdir "%TARGET_PATH%\config"

echo.
echo 📦 Moving files by category...

REM Move Python files
echo 🐍 Moving Python files...
for %%f in (*.py) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\" >nul
        echo    ✅ %%f
    )
)

REM Move documentation files
echo 📚 Moving documentation...
for %%f in (*.md) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\docs\" >nul
        echo    ✅ docs\%%f
    )
)

REM Move HTML files (frontend)
echo 🌐 Moving frontend files...
for %%f in (*.html) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\frontend\" >nul
        echo    ✅ frontend\%%f
    )
)

REM Move configuration files
echo ⚙️ Moving configuration files...
if exist "requirements.txt" (
    copy "requirements.txt" "%TARGET_PATH%\" >nul
    echo    ✅ requirements.txt
)
if exist "render.yaml" (
    copy "render.yaml" "%TARGET_PATH%\" >nul
    echo    ✅ render.yaml
)
if exist ".gitignore" (
    copy ".gitignore" "%TARGET_PATH%\" >nul
    echo    ✅ .gitignore
)
if exist ".gitattributes" (
    copy ".gitattributes" "%TARGET_PATH%\" >nul
    echo    ✅ .gitattributes
)
if exist "CNAME" (
    copy "CNAME" "%TARGET_PATH%\" >nul
    echo    ✅ CNAME
)

REM Move service account key
echo 🔑 Moving service account key...
if exist "service-account-key.json" (
    copy "service-account-key.json" "%TARGET_PATH%\" >nul
    echo    ✅ service-account-key.json
)

REM Move batch scripts
echo 🤖 Moving automation scripts...
for %%f in (*.bat) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\scripts\" >nul
        echo    ✅ scripts\%%f
    )
)

REM Move PowerShell scripts
echo 🔧 Moving PowerShell scripts...
for %%f in (*.ps1) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\scripts\" >nul
        echo    ✅ scripts\%%f
    )
)

REM Move other important files
echo 📄 Moving other files...
if exist "README.md" (
    copy "README.md" "%TARGET_PATH%\" >nul
    echo    ✅ README.md
)
for %%f in (*.txt) do (
    if exist "%%f" (
        copy "%%f" "%TARGET_PATH%\config\" >nul
        echo    ✅ config\%%f
    )
)

REM Copy git folder if it exists (optional)
if exist ".git" (
    echo 📋 Git repository detected
    set /p copygit="Copy .git folder to maintain version control? (y/N): "
    if /i "!copygit!"=="y" (
        echo 🔄 Copying git repository...
        xcopy ".git" "%TARGET_PATH%\.git" /E /I /H >nul
        echo    ✅ .git folder copied
    )
)

echo.
echo 🎯 Creating project launcher...

REM Create a launcher script in the new location
(
echo @echo off
echo echo ========================================
echo echo PHARMACY COMPLIANCE LAB REPORTS
echo echo ========================================
echo echo.
echo echo 📁 Project location: %%CD%%
echo echo 🔑 Service account: service-account-key.json
echo echo 🐍 Backend: BACKEND_SERVICE_ACCOUNT.py
echo echo 🌐 Frontend: frontend\
echo echo 📚 Documentation: docs\
echo echo.
echo echo 🚀 Available commands:
echo echo 1. Test backend:     python BACKEND_SERVICE_ACCOUNT.py
echo echo 2. Test connection:  python test_google_drive_connectivity.py
echo echo 3. Open frontend:    start frontend\index.html
echo echo 4. View docs:        start docs\
echo echo.
echo pause
) > "%TARGET_PATH%\START_PROJECT.bat"

echo.
echo ========================================
echo 🎉 PROJECT MIGRATION COMPLETE!
echo ========================================
echo.

echo 📊 NEW PROJECT STRUCTURE:
echo %TARGET_PATH%\
echo ├── 🐍 Python files (backend, tests)
echo ├── 🔑 service-account-key.json
echo ├── ⚙️ requirements.txt, render.yaml
echo ├── 📚 docs\ (all documentation)
echo ├── 🌐 frontend\ (HTML files)
echo ├── 🤖 scripts\ (batch and PowerShell)
echo ├── 📄 config\ (configuration files)
echo └── 🚀 START_PROJECT.bat (launcher)
echo.

echo ✅ BENEFITS:
echo - Centralized project location
echo - Organized file structure
echo - Easy access from Documents
echo - Professional workspace
echo - Clean separation of file types
echo.

echo 🎯 NEXT STEPS:
echo 1. Navigate to: %TARGET_PATH%
echo 2. Run: START_PROJECT.bat
echo 3. Test: python BACKEND_SERVICE_ACCOUNT.py
echo 4. Update your IDE/editor to use new location
echo.

echo Opening new project location...
explorer "%TARGET_PATH%"

echo.
echo 📋 IMPORTANT: Update your development environment
echo - Change working directory to: %TARGET_PATH%
echo - Update any bookmarks or shortcuts
echo - Consider deleting old project files after verification
echo.

:end
pause