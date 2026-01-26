@echo off
echo ========================================
echo FIND PYTHON INSTALLATION
echo ========================================
echo.

echo 🔍 Searching for Python installations on your system...
echo.

echo 📋 Method 1: Checking common Python locations...
set "FOUND_PYTHON="

REM Check common Python installation paths
set "PATHS_TO_CHECK=C:\Python39 C:\Python310 C:\Python311 C:\Python312 C:\Python313 C:\Python314"
set "PATHS_TO_CHECK=%PATHS_TO_CHECK% C:\Program Files\Python39 C:\Program Files\Python310 C:\Program Files\Python311"
set "PATHS_TO_CHECK=%PATHS_TO_CHECK% C:\Program Files\Python312 C:\Program Files\Python313 C:\Program Files\Python314"
set "PATHS_TO_CHECK=%PATHS_TO_CHECK% C:\Users\%USERNAME%\AppData\Local\Programs\Python"
set "PATHS_TO_CHECK=%PATHS_TO_CHECK% C:\pythoncore-3.14-64"

for %%p in (%PATHS_TO_CHECK%) do (
    if exist "%%p\python.exe" (
        echo ✅ Found Python at: %%p
        "%%p\python.exe" --version 2>nul
        set "FOUND_PYTHON=%%p"
    )
)

echo.
echo 📋 Method 2: Using WHERE command...
where python 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ Python found in PATH
) else (
    echo ⚠️ Python not found in PATH
)

echo.
echo 📋 Method 3: Using Python Launcher (py)...
py --version 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ Python Launcher (py) available
    py -c "import sys; print('Python path:', sys.executable)"
) else (
    echo ⚠️ Python Launcher (py) not available
)

echo.
echo 📋 Method 4: Checking Windows Store Python...
if exist "%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\python.exe" (
    echo ✅ Windows Store Python found
    "%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\python.exe" --version 2>nul
)

echo.
echo 📋 Method 5: Registry search...
echo 🔍 Searching Windows Registry for Python installations...

REM Search registry for Python installations
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Python" /s 2>nul | findstr /i "InstallPath" 2>nul
reg query "HKEY_CURRENT_USER\SOFTWARE\Python" /s 2>nul | findstr /i "InstallPath" 2>nul

echo.
echo ========================================
echo 🎯 PYTHON DETECTION COMPLETE
echo ========================================
echo.

if defined FOUND_PYTHON (
    echo ✅ RECOMMENDED PYTHON PATH: %FOUND_PYTHON%
    echo.
    echo 🔧 To use this Python installation:
    echo 1. Edit SETUP_PYTHON_PATH.bat
    echo 2. Change PYTHON_PATH to: %FOUND_PYTHON%
    echo 3. Run the setup script again
) else (
    echo ❌ NO PYTHON INSTALLATION FOUND
    echo.
    echo 📋 SOLUTIONS:
    echo 1. Install Python from: https://python.org/downloads/
    echo 2. Install Python from Microsoft Store
    echo 3. Use Python Launcher (py) if available
    echo 4. Check if Python is installed but not in standard locations
)

echo.
echo 💡 MANUAL CHECK:
echo Open File Explorer and navigate to C:\ to look for Python folders
echo Common names: Python39, Python310, Python311, Python312, etc.
echo.

pause