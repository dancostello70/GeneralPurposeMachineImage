@echo off
:: Updater for CS_DP200 (CareSource Introduction to Azure Data Technologies)
:: Version 1.2
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\CS_DP200
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\CS_DP200ClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1