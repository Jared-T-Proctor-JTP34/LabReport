@echo off
echo ========================================
echo GitHub Repository Setup
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git not found. Please install Git for Windows first:
    echo 🔗 https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo ✅ Git found
echo.

REM Check if already a Git repository
if exist ".git" (
    echo ✅ Git repository already initialized
) else (
    echo 🔧 Initializing Git repository...
    git init
)

echo.
echo 📋 Please enter your GitHub repository details:
echo.
set /p GITHUB_USERNAME="GitHub Username: "
set /p REPO_NAME="Repository Name: "

echo.
echo 🔧 Setting up remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo.
echo 📦 Adding files to Git...
git add .

echo.
echo 💾 Creating initial commit...
git commit -m "Initial commit: Pharmacy Compliance System"

echo.
echo 🚀 Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ✅ Repository successfully connected to GitHub!
echo 🔗 Repository URL: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo.
pause