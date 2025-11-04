@echo off
title Deploy Hugo Site - bvinayreddy.com
echo ==========================================
echo   Building and Deploying bvinayreddy.com
echo ==========================================
echo.

:: Step 1 - Move to your main Hugo folder
cd /d "C:\0. bvinayreddy"

:: Step 2 - Build the site
echo Building site with Hugo...
hugo --gc --minify --cleanDestinationDir
if %errorlevel% neq 0 (
    echo Hugo build failed! Check your content or config.
    pause
    exit /b
)

:: Step 3 - Go to public folder and push to GitHub
cd public
echo.
echo Deploying to GitHub...
git add -A
git commit -m "Auto-deploy: updated content"
git push

echo.
echo ✅ Deployment complete! Check https://bvinayreddy.com
pause
