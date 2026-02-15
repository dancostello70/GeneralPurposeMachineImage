@echo off
:: Setup file for BDXM01 (Power BI Tools: DAX Introduction, 2nd Edition)
:: Version 2.0
:: Last update: 15 Feb 2026
:: Author: Dan Costello (dan@costellotech.com)
:: Notes: This setup file corresponds to the second edition of the DAX Intro course
::        It uses the May 2025 version (2.143.1378.0) of Power BI Desktop, the August 8, 2025 version (3.3.3) of DAX Studio,
::        and the files for the second edition of the course (https://github.com/CostelloTechnicalConsulting/DAXIntro/releases/tag/v2.8). 

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=BDXM01-May25
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

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%