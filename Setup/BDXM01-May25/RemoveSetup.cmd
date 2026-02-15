@echo off
:: Uninstall file for BDXM01 (Power BI Tools: DAX Introduction, 2nd Edition)
:: Version 2.0
:: Last update: 15 Feb 2026
:: Author: Dan Costello (dan@costellotech.com)
:: Notes: This uninstall file corresponds to the second edition of the DAX Intro course
::        It uses the May 2025 version (2.143.1378.0) of Power BI Desktop, the August 8, 2025 version (3.3.3) of DAX Studio,
::        and the files for the second edition of the course (https://github.com/CostelloTechnicalConsulting/DAXIntro/releases/tag/v2.8). 

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=BDXM01-May25
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\UninstallLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles

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
