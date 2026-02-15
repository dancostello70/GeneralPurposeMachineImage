::@echo off
:: Uninstall file for APL300 (PL-300: Microsoft Power BI Data Analyst)
:: Version 1.0
:: Last update: 2022-03-08
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=APL300
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\%CLASSID%_UninstallLog.log
SET CLASSDIR=D:\Allfiles

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
