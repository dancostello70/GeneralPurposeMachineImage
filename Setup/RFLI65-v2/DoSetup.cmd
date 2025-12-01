@echo off
:: Setup file for RFLI65-v2 (Power Automate: Introduction for End Users)
:: Version 1.0
:: Last update: 2025-11-30
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=RFLI65-v2
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\RFLI65-Power-Automate-Intro


:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Beginning setup of %CLASSID%

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadExtractInstall.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%

echo Download setup install complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Pause for 5 seconds
echo Pausing for 5 seconds...
timeout /t 5 /nobreak > nul
echo Pause complete >> %LOGFILE%

:: Clone git repo
echo Cloning RFLI65-v2 GitHub repository
"%PROGRAMFILES%\Git\cmd\git.exe" clone https://github.com/ONLC-ClassMaterials/RFLI65-Power-Automate-Intro.git %CLASSDIR%


:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%