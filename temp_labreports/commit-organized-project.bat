@echo off
echo 🚀 Committing Organized Project Structure...
echo.

REM Navigate to repository root
cd ..

echo 📊 Checking git status...
git status

echo.
echo 📁 Adding all changes...
git add .

echo.
echo 🗑️  Removing any deleted files from git...
git add -u

echo.
echo 💾 Committing organized project structure...
git commit -m "organize: Ensure all project files are in Labreports folder

✅ All pharmacy compliance application files organized in Labreports/
✅ Core application: Pharmacy_Compliance_Backend.html, index.html, backend
✅ Documentation: README.md, setup guides, testing instructions  
✅ Development tools: test_backend.py, local-https-server.py
✅ Configuration: .gitignore, CNAME, SSL certificates
✅ GitHub Actions: .github/workflows/deploy.yml
✅ Clean repository structure with proper organization

Project Structure:
Repository/
├── .git/ (repository data)
├── Labreports/ (all project files)
│   ├── Pharmacy_Compliance_Backend.html
│   ├── google_drive_backend.py  
│   ├── README.md
│   └── ... (all application files)
└── (no loose files)

Version 2.2 - Properly organized project structure"

echo.
echo 🌐 Pushing to GitHub...
git push origin main

echo.
echo ✅ Project organization successfully committed!
echo.
echo 📂 Project Benefits:
echo    • All files properly organized in Labreports folder
echo    • Clean repository root
echo    • Easy to navigate and maintain
echo    • Professional project structure
echo.
echo 🌍 Your application will be available at:
echo    • https://labreporttool.xyz  
echo    • https://jared-t-proctor-jtp34.github.io/LabReport/
echo.

REM Return to Labreports directory
cd Labreports

pause