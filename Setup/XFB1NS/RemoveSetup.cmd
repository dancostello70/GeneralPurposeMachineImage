::@echo off
:: Uninstall file for XFB1NS (Microsoft Fabric: Getting Started)
:: Version 1.0
:: Last update: 2024-02-19
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=XFB1NS
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\%CLASSID%_UninstallLog.log
SET CLASSDIR=D:\XFB1NS

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

del "%USERPROFILE%\Desktop\*.lnk"

del /f /s /q %CLASSDIR%\*.*
rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%
