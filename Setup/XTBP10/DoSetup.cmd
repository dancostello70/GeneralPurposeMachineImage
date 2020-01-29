@echo off
:: Setup file for XTBP10 (Tableau Prep Introduction)
:: Version 1.2
:: Last update: 29 Jan 2020
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XTBP10
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\XTBP10ClassFiles

:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Beginning setup of XTBP10

:: Download files
echo Downloading files
echo (Please be patient -- the files for this class are quite large)
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\DownloadFiles.ps1

echo Downloads complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\UpdateClassfilesFromGithub.ps1

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
cd %SETUPDIR%\Installers

echo Installing Tableau Prep
TableauPrep-2020-1-1.exe /quiet /norestart /log %SETUPDIR%\TableauPrepSetupLog.log ACCEPTEULA=1

echo Installing Tableau Desktop
TableauDesktop-64bit-2019-4-1.exe /quiet /norestart /log %SETUPDIR%\TableauDesktopSetupLog.log ACCEPTEULA=1

:: Install databases
echo Setting up SQL Server databases
call %CLASSDIR%\Setup\Setup.cmd

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%