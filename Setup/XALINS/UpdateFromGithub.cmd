@echo off
:: Updater for XALINS (Alteryx Concepts - Level 1)
:: Version 1.2
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XALINS
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\XALINSClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1