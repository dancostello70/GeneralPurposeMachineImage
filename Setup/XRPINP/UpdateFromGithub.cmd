@echo off
:: Updater for XRPINP (R Programming Introduction)
:: Version 1.0
:: Last update: 9 Sep 2020
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XRPINP
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\XRPINPClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1-ClassId %CLASSID%