@echo off
REM Python Launcher for Pharmacy Compliance Project
REM Uses Windows Store Python installation

set "PYTHON_PATH=C:\Users\jared\AppData\Local\Microsoft\WindowsApps"
set "PYTHON_EXE=%PYTHON_PATH%\python.exe"

REM Check if Python exists
if not exist "%PYTHON_EXE%" (
    echo ❌ Python not found at: %PYTHON_EXE%
    echo 📋 Trying alternative Python locations...
    
    REM Try py launcher
    py --version >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Using Python Launcher (py)
        py %*
        exit /b %ERRORLEVEL%
    )
    
    REM Try python in PATH
    python --version >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Using Python from PATH
        python %*
        exit /b %ERRORLEVEL%
    )
    
    echo ❌ No Python installation found
    pause
    exit /b 1
)

REM Use the Windows Store Python
"%PYTHON_EXE%" %*