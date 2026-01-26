@echo off
REM Pip Launcher for Pharmacy Compliance Project
REM Uses Windows Store Python installation

set "PYTHON_PATH=C:\Users\jared\AppData\Local\Microsoft\WindowsApps"
set "PYTHON_EXE=%PYTHON_PATH%\python.exe"

REM Check if Python exists
if not exist "%PYTHON_EXE%" (
    echo ❌ Python not found at: %PYTHON_EXE%
    echo 📋 Trying alternative pip locations...
    
    REM Try py launcher with pip
    py -m pip --version >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Using pip via Python Launcher (py)
        py -m pip %*
        exit /b %ERRORLEVEL%
    )
    
    REM Try pip in PATH
    pip --version >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Using pip from PATH
        pip %*
        exit /b %ERRORLEVEL%
    )
    
    echo ❌ No pip installation found
    pause
    exit /b 1
)

REM Use pip with Windows Store Python
"%PYTHON_EXE%" -m pip %*