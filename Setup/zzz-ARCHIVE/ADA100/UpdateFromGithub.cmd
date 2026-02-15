@echo off
:: Updater for ADA100 (Analyzing Data with Power BI)
:: Version 1.2
:: Last update: 7 Oct 2020
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\ADA100
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\ADA100ClassFiles

:: Update from GitHub
echo Updating ADA100 from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1