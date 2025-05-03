@echo off
:: Setup file for XSQL-01-02 (Intro to SQL/Advanced SQL)
:: Version 1.0
:: Last update: 2025-04-06
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XSQL-01-02-v2
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


:: Install databases
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Send an alert
:: powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%