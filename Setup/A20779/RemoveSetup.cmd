::@echo off
:: Uninstall file for A20779 (Analyzing Data with Excel)
:: Version 1.0
:: Last update: __________
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=A20779
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\%CLASSID%_UninstallLog.log
SET CLASSDIR=C:\Coursefiles\DAXIntro

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Do uninstalls

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\UninstallAll.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%

:: Delete stuff
cd %SETUPROOT%
rmdir /s /q %SETUPDIR%
del %SETUPROOT%\%CLASSID%.zip

del "%USERPROFILE%\Desktop\DAX Intro Files.lnk"

del /f /s /q %CLASSDIR%\*.*
rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%
