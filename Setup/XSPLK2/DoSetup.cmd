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

:: Dummy run of winget
winget

powershell -ExecutionPolicy Bypass -Command "Start-Sleep 5"

:: Install git
::winget install --id Git.Git -e --silent --accept-source-agreements --source winget

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadGitInstaller.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%
"%SETUPDIR%\Installers\Git-2.42.0.2-64-bit.exe" /VERYSILENT /NORESTART

echo Beginning setup of %CLASSID%

:: Clone class files from GitHub
rd c:\XSPLK2ClassFiles /s /q

"%ProgramFiles%\Git\bin\git.exe" clone https://github.com/ONLC-ClassMaterials/XSPLK2ClassFiles c:\XSPLK2ClassFiles

:: Clone book files from GitHub
"%ProgramFiles%\Git\bin\git.exe" clone https://github.com/PacktPublishing/Improving-your-Splunk-skills C:\Improving-your-Splunk-skills-master



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