@echo off
echo ========================================
echo PHARMACY COMPLIANCE LAB REPORTS
echo ========================================
echo.
echo 📁 Project location: %CD%
echo 🔑 Service account: service-account-key.json
echo 🐍 Backend: BACKEND_SERVICE_ACCOUNT.py
echo 🌐 Frontend: frontend\
echo 📚 Documentation: docs\
echo.
echo 🚀 Available commands:
echo 1. Test backend:     python BACKEND_SERVICE_ACCOUNT.py
echo 2. Test connection:  python test_google_drive_connectivity.py
echo 3. Open frontend:    start frontend\index.html
echo 4. View docs:        start docs\
echo.
pause
