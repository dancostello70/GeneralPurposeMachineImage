@echo off
:: Setup file for XFB1NS (Microsoft Fabric: Getting Started)
:: Version 1.0
:: Last update: 2024-02-17
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" (SET SETUPROOT=C:\Setup)
SET CLASSID=XFB1NS
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

:: Install databases
:: echo Setting up SQL Server databases
:: call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Pin stuff to taskbar

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\PinToTaskbar.ps1 -Target "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe"

:: Change the Execution Policy
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SetExecutionPolicy.ps1 

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%