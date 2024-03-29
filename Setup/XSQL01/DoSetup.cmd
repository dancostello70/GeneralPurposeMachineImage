@echo off
:: Setup file for XSQL01 (SQL Querying: Fundamentals)
:: Version 1.1
:: Last update: 2 Feb 2023
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" (SET SETUPROOT=%~dp0)

SET CLASSID=XSQL01
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

:: Move the class directory to the right place
 move C:\094018Files1_0_patched\094018Data c:\

:: Update from GitHub
:: echo Updating from GitHub
:: powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UpdateClassfilesFromGithub.ps1 -ClassId %CLASSID%

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
:: cd %SETUPDIR%\Installers

:: echo Installing __Application__
:: __ApplicationSpecificInstallerCommandLine__

:: Install databases
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%
