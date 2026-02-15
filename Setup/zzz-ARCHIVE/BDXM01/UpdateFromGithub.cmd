@echo off
:: Updater for BDXM01 (DAX Formulas for Dynamic Tables)
:: Version 1.2
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\BDXM01
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\BDXM01ClassFiles

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1