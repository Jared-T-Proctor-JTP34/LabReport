@echo off
echo ========================================
echo Waiting for Render Redeployment
echo ========================================
echo.
echo Waiting 2 minutes for deployment to complete...
timeout /t 120 /nobreak
echo.
echo Testing backend status...
python quick_test.py
echo.
echo If still 404, check Render dashboard:
echo https://render.com/dashboard
pause