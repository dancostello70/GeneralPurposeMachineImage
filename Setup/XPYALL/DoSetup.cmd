@echo off
:: Setup file for XPYALL (All Python classes (XPYINP, XPYI30, XPYS30))
:: Version 1.0
:: Last update: 2026-02-15
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XPYALL
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles


:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Beginning setup of %CLASSID%

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadExtractInstall.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%

echo Download setup install complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Clone git repo
:: echo Cloning XPYALL GitHub repository
:: "%PROGRAMFILES%\Git\cmd\git.exe" clone _________________


:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Install Python modules
:: echo Installing Python modules
:: start "" %SETUPDIR%\Scripts\InstallPythonModules.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%