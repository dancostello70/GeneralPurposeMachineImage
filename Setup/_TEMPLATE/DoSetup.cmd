@echo off
:: Setup file for __ClassID__ (__ClassName__)
:: Version 1.0
:: Last update: 27 Feb 2020
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSID=__ClassID__
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

echo Installing __Application__
__ApplicationSpecificInstallerCommandLine__

:: Install databases
echo Setting up SQL Server databases
call %CLASSDIR%\Setup\Setup.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\SendAlert.ps1

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%