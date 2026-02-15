@echo off
:: Setup file for BDXM01 (DAX Formulas for Dynamic Tables)
:: Version 1.1
:: Last update: 2 Apr 2021
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=BDXM01
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles

:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Beginning setup of %CLASSID%

:: Download files
echo Downloading files
:: echo (Please be patient -- the files for this class are quite large)
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadFiles.ps1 -ClassId %CLASSID%

echo Downloads complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\ExtractArchives.ps1 -ClassId %CLASSID%

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
cd %SETUPDIR%\Installers

echo Installing Power BI Desktop
PBIDesktopSetup_x64.exe -q ACCEPT_EULA=1

:: Install databases
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%