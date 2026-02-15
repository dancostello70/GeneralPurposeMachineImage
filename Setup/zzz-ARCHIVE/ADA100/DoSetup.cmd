@echo off
:: Setup file for ADA100 (Analyzing Data with Power BI)
:: Version 3.0
:: Last update: 9 Aug 2021
:: Author: Dan Costello (dan@costellotech.com)
:: Version notes: Added new Aug 2021 version of lab files from GitHub, updated execution policy

SET CLASSID=ADA100
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
:: powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadFiles.ps1 -ClassId %CLASSID%
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadFilesWithCheck.ps1 -ClassId %CLASSID%

echo Downloads complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\ExtractArchives.ps1 -ClassId %CLASSID%

:: Update from GitHub
:: echo Updating from GitHub
:: powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1 -ClassId %CLASSID%

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
cd %SETUPDIR%\Installers

echo Installing Power BI Desktop
PBIDesktopSetup_x64.exe -q ACCEPT_EULA=1

echo Installing Power BI Report Builder
msiexec /i PowerBiReportBuilder.en-US.msi /quiet

:: Pin stuff to taskbar
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\PinToTaskbar.ps1 -Target "C:\Program Files (x86)\Power BI Report Builder\PowerBIReportBuilder.exe"
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\PinToTaskbar.ps1 -Target "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe"

:: Install databases
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Change the Execution Policy
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SetExecutionPolicy.ps1 

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%