@echo off
:: Setup file for XALINS (Alteryx Concepts - Level 1)
:: EDITED TO ADD: *and* XAL2NS (Alteryx Level 2)
:: Version 2.0
:: Last update: 16 April 2021
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XALINS
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
echo (Please be patient -- the files for this class are quite large)
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadFiles.ps1 -ClassId %CLASSID%

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

echo Installing Tableau Desktop
TableauDesktop-64bit-2020-3-0.exe /quiet /norestart /log %SETUPDIR%\TableauDesktopSetupLog.log ACCEPTEULA=1

:: echo Installing Alteryx Designer
:: AlteryxTrialInstallx64_2020.4.5.12471.exe /s /l=%SETUPDIR%\AlteryxInstallLog.log

echo Installing Alteryx Designer (2021)
AlteryxNonAdminInstallx64_2021.4.2.02731.exe /s /l=%SETUPDIR%\AlteryxInstallLog.log

:: Install databases
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%