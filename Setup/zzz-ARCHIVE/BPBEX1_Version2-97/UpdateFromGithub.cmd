@echo off
:: Updater for XTBP10 (Tableau Prep Introduction)
:: Version 1.2
:: Last update: 29 Jan 2020
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XTBP10
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\XTBP10ClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\UpdateClassfilesFromGithub.ps1