@echo off
:: Setup file for XSPLK2 (Splunk Fundamentals Level 2)
:: Version 1.0
:: Last update: 2022-06-15
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XSPLK2
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles


:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Install git
winget install --id Git.Git -e --silent --accept-source-agreements --source winget

echo Beginning setup of %CLASSID%

:: Clone from GitHub
"%ProgramFiles%\Git\bin\git.exe" clone https://github.com/ONLC-ClassMaterials/XSPLK2ClassFiles c:\XSPLK2ClassFiles

:: Download extract install everything else (merge with GitHub repo)
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadExtractInstall.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%

echo Download setup install complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%