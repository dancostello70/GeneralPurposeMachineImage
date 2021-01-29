::@echo off
:: Uninstall file for XALINS (Alteryx Concepts - Level 1)
:: Version 1.0
:: Last update: 28 Jan 2021
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=XALINS
SET SETUPDIR=%SETUPROOT%\%CLASSCODE%
SET LOGFILE=%SETUPROOT%\%CLASSCODE%_UninstallLog.log
SET CLASSDIR=C:\%CLASSCODE%ClassFiles

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Do uninstalls
cd %SETUPDIR%\Installers

:: Delete stuff
cd %SETUPROOT%
rmdir /s /q %SETUPDIR%
del %SETUPROOT%\%CLASSCODE%.zip

rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%