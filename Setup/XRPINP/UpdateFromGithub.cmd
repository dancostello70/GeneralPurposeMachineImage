@echo off
:: Updater for XRPINP (R Programming Introduction)
:: Version 1.0
:: Last update: 9 Sep 2020
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSID=XRPINP
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1 -ClassId %CLASSID%