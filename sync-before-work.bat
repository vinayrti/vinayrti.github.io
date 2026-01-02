@echo off
title BVinayReddy.com – Git Safe Sync

echo ================================
echo  Git Sync Started
echo ================================
echo.

cd /d "C:\0. bvinayreddy"

echo Fetching latest changes from GitHub...
git fetch origin

echo.
echo Pulling updates (Decap CMS + remote commits)...
git pull origin main

echo.
echo Current Git Status:
git status

echo.
echo ================================
echo  Sync Completed Successfully
echo ================================
echo.

pause
