@echo off
echo ========================================
echo Sync Project with GitHub
echo ========================================
echo.

echo 📦 Adding new files...
"C:\Program Files\Git\bin\git.exe" add .

echo.
echo 💾 Committing changes...
"C:\Program Files\Git\bin\git.exe" commit -m "Update project structure and add new files"

echo.
echo 🚀 Pushing to GitHub...
"C:\Program Files\Git\bin\git.exe" push origin main

echo.
echo ✅ Project synced with GitHub!
echo.
pause