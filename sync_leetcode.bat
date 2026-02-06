@echo off
chcp 65001 > nul
cd /d "%~dp0"

echo [1/4] Updating README.md...
powershell -ExecutionPolicy Bypass -NoProfile -File ".\update_readme.ps1"
echo.

echo [2/4] Adding all changes to Git...
git add .
echo.

echo [3/4] Committing changes...
git commit -m "Automated Sync: Update notes and progress"
echo.

echo [4/4] Pushing to GitHub...
git pull --rebase
git push origin main
echo.

echo Sync complete!
pause
