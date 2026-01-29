@echo off
echo ========================================
echo Testing Backend Deployment
echo ========================================
echo.
echo Running deployment check...
python check_deployment.py
echo.
echo If successful, visit: https://labreporttool.xyz
echo Your app should now show "Backend Connected"
echo.
pause