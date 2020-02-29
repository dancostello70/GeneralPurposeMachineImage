::@echo off
:: Uninstall file for XSQL01
:: Version 1.0s
:: Last update: 29 Feb 2020
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=XSQL01
SET SETUPDIR=%SETUPROOT%\%CLASSCODE%
SET LOGFILE=%SETUPROOT%\%CLASSCODE%_UninstallLog.log
SET CLASSDIR=C:\094018Files1_0
SET CLASSDIR2=C:\094018Data

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%


:: Drop databases
echo Dropping SQL Server databases
call %SETUPDIR%\Scripts\RemoveDbs.cmd

:: Delete stuff
:: Installer archive
cd %SETUPROOT%
del %SETUPROOT%\%CLASSCODE%.zip

:: Class directories
rmdir /s /q %CLASSDIR%
rmdir /s /q %CLASSDIR2%

:: Desktop shortcuts
del /q %USERPROFILE%\Desktop\SQL*.lnk
del /q %USERPROFILE%\Desktop\XSQL*.lnk

:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%


echo rmdir /s /q %SETUPDIR% > %TEMP%\DeleteMe.cmd
START CMD /c %TEMP%\DeleteMe.cmd