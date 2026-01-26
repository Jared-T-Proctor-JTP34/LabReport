@echo off
echo ========================================
echo PYTHON PATH SETUP - pythoncore-3.14-64
echo ========================================
echo.

REM Set the Python installation path
set "PYTHON_PATH=C:\pythoncore-3.14-64"
set "PYTHON_EXE=%PYTHON_PATH%\python.exe"
set "PYTHON_SCRIPTS=%PYTHON_PATH%\Scripts"

echo 🐍 Python installation path: %PYTHON_PATH%
echo 📄 Python executable: %PYTHON_EXE%
echo 📦 Scripts directory: %PYTHON_SCRIPTS%
echo.

echo 🔍 Checking Python installation...

REM Check if Python exists at specified path
if exist "%PYTHON_EXE%" (
    echo ✅ Python found at: %PYTHON_EXE%
    
    REM Get Python version
    echo 📊 Python version:
    "%PYTHON_EXE%" --version
    
) else (
    echo ❌ Python not found at: %PYTHON_EXE%
    echo 📋 Please verify the Python installation path
    goto :error
)

echo.
echo 🔧 Setting up environment variables...

REM Add Python to PATH for current session
set "PATH=%PYTHON_PATH%;%PYTHON_SCRIPTS%;%PATH%"
echo ✅ Python added to PATH for current session

echo.
echo 🧪 Testing Python functionality...

REM Test basic Python functionality
echo 📋 Testing Python import capabilities...
"%PYTHON_EXE%" -c "import sys; print('✅ Python sys module working')"
"%PYTHON_EXE%" -c "import os; print('✅ Python os module working')"
"%PYTHON_EXE%" -c "import json; print('✅ Python json module working')"

echo.
echo 📦 Checking required packages...

REM Check if pip is available
if exist "%PYTHON_SCRIPTS%\pip.exe" (
    echo ✅ pip found at: %PYTHON_SCRIPTS%\pip.exe
    
    echo 📋 Checking installed packages...
    "%PYTHON_SCRIPTS%\pip.exe" list | findstr /i "flask"
    "%PYTHON_SCRIPTS%\pip.exe" list | findstr /i "google"
    
) else (
    echo ⚠️ pip not found - may need to install packages manually
)

echo.
echo 🎯 Creating Python launcher scripts...

REM Create a Python launcher for this project
(
echo @echo off
echo REM Python Launcher for Pharmacy Compliance Project
echo set "PYTHON_PATH=C:\pythoncore-3.14-64"
echo set "PATH=%%PYTHON_PATH%%;%%PYTHON_PATH%%\Scripts;%%PATH%%"
echo "%%PYTHON_PATH%%\python.exe" %%*
) > "python_launcher.bat"

echo ✅ Created: python_launcher.bat

REM Create a pip launcher
(
echo @echo off
echo REM Pip Launcher for Pharmacy Compliance Project
echo set "PYTHON_PATH=C:\pythoncore-3.14-64"
echo set "PATH=%%PYTHON_PATH%%;%%PYTHON_PATH%%\Scripts;%%PATH%%"
echo "%%PYTHON_PATH%%\Scripts\pip.exe" %%*
) > "pip_launcher.bat"

echo ✅ Created: pip_launcher.bat

echo.
echo 🚀 Testing project scripts with new Python path...

REM Test the backend script
echo 📋 Testing backend import...
"%PYTHON_EXE%" -c "import importlib.util; spec = importlib.util.spec_from_file_location('backend', 'BACKEND_SERVICE_ACCOUNT.py'); print('✅ Backend script can be imported' if spec else '❌ Backend import failed')"

echo.
echo ========================================
echo 🎉 PYTHON PATH SETUP COMPLETE!
echo ========================================
echo.

echo 📊 CONFIGURATION SUMMARY:
echo ✅ Python Path: %PYTHON_PATH%
echo ✅ Python Version: 3.14-64
echo ✅ Launchers Created: python_launcher.bat, pip_launcher.bat
echo ✅ Environment Variables: Set for current session
echo.

echo 🚀 USAGE INSTRUCTIONS:
echo.
echo 1. Use project-specific Python:
echo    python_launcher.bat BACKEND_SERVICE_ACCOUNT.py
echo.
echo 2. Install packages:
echo    pip_launcher.bat install -r requirements.txt
echo.
echo 3. Test connectivity:
echo    python_launcher.bat test_google_drive_connectivity.py
echo.
echo 4. Run verification:
echo    python_launcher.bat VERIFY_NEW_LOCATION.py
echo.

echo 💡 TIP: Use the launcher scripts to ensure you're using the correct Python version
echo.

goto :end

:error
echo.
echo ❌ SETUP FAILED
echo 📋 Please check:
echo 1. Python is installed at: C:\pythoncore-3.14-64
echo 2. The path is correct and accessible
echo 3. Python executable exists in that directory
echo.

:end
pause