::@echo off
:: Uninstall file for XPYALL (All Python classes (XPYINP, XPYI30, XPYS30))
:: Version 1.0
:: Last update: 2026-02-15
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XPYALL
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\%CLASSID%_UninstallLog.log
SET CLASSDIR=C:\Coursefiles

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


del /f /s /q %CLASSDIR%\*.*
rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%
