@echo off
:: Updater for __ClassID__ (__ClassName__)
:: Version 1.2
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\__ClassID__
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\__ClassID__ClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1