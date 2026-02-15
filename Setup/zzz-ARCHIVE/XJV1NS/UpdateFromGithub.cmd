@echo off
:: Updater for XJV1NS (Java Programming Level 1/2)
:: Version 1.2
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XJV1NS
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\XJV1NSClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1