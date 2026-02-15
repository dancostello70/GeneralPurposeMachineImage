::@echo off
:: Uninstall file for __ClassID__ (__ClassName__)
:: Version 1.0
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=__ClassID__
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