@echo off
echo ==========================================
echo      LeetCode Notes Sync Tool
echo ==========================================
cd /d "%~dp0"

echo [1/5] Updating README stats...
powershell -ExecutionPolicy Bypass -File "update_readme.ps1"

echo [2/5] Adding changes...
git add .

echo [3/5] Committing...
set "timestamp=%date% %time%"
git commit -m "Update notes: %timestamp%"

echo [4/5] Pulling updates (rebase)...
git pull origin main --rebase

echo [5/5] Pushing to GitHub...
git push origin main

echo.
echo ==========================================
echo      Sync Complete!
echo ==========================================
if "%1"=="auto" (
    echo Auto-sync finished.
    timeout /t 5
    exit
) else (
    timeout /t 5
)
