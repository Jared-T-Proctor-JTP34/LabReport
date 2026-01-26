@echo off
echo Opening Git Bash in current directory...
cd /d "%~dp0"
"C:\Program Files\Git\git-bash.exe" --cd="%CD%"