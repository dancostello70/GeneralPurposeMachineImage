@echo off
:: Setup file for CS_DP200 (CareSource Introduction to Azure Data Technologies)
:: Version 1.0
:: Last update: 10 Feb 2021
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=CS_DP200
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\AzureDataClassFiles

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

echo Installing JDK
jdk-8u281-windows-x64.exe /s

echo Installing IntelliJ
ideaIC-2020.3.2.exe  /S /CONFIG=%SETUPDIR%\Installers\silent.config

echo Installing Scala
msiexec /i scala-2.13.4.msi /quiet /norestart ACCEPT_EULA=1 /log scalalog.log

echo Installing Python 3.9.1
python-3.9.1-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

:: Install databases
:: echo Setting up SQL Server databases
:: call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Remove Edge from the Taskbar
echo Removing Edge from the Taskbar
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\RemoveEdgeFromTaskbar.ps1

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%