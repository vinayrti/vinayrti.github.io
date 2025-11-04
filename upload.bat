@echo off
echo ====================================================
echo        SAFE HUGO UPLOAD SCRIPT (upload.bat)
echo ====================================================
cd /d "C:\0. bvinayreddy"

:: Check if Hugo is installed
where hugo >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Hugo is not installed or not in PATH.
    echo Please install Hugo or check your system PATH.
    pause
    exit /b
)

:: Step 1 — Build the site
echo.
echo [1/4] Building site with Hugo...
hugo --gc --minify
if %errorlevel% neq 0 (
    echo ERROR: Hugo build failed. Check your site configuration.
    pause
    exit /b
)

:: Step 2 — Commit local changes
echo.
echo [2/4] Committing local changes to main branch...
git add .
git commit -m "Update site content"
if %errorlevel% neq 0 (
    echo No new changes to commit or commit failed.
)

:: Step 3 — Push to main (backup)
echo.
echo [3/4] Pushing main branch to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo WARNING: Could not push main branch.
)

:: Step 4 — Deploy /public to gh-pages
echo.
echo [4/4] Deploying to GitHub Pages (gh-pages branch)...
git subtree push --prefix public origin gh-pages
if %errorlevel% neq 0 (
    echo ERROR: Deployment failed. Check GitHub settings or connection.
    pause
    exit /b
)

echo.
echo ====================================================
echo ✅ Deployment Complete!
echo Visit your live site: https://bvinayreddy.com
echo ====================================================
pause
