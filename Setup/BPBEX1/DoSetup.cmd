@echo off
:: Setup file for BPBEX1 (Power BI for Excel Users)
:: Also BPQM01 and WEXF01
:: Version 1.1
:: Last update: 1 Jul 2024
:: Author: Dan Costello (dan@costellotech.com)
:: Notes:   - Updated version of Power BI to Nov 2023 version (2.123.742.0)
::          - Added data files for web-based labs
::          - Updated lab solution files

SET CLASSID=BPBEX1
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
:: Install Power BI Desktop
%SETUPDIR%\Installers\PBIDesktopSetup_x64.exe -q ACCEPT_EULA=1

:: Install databases
:: echo Setting up SQL Server databases
:: call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%