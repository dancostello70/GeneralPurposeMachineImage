::@echo off
:: Uninstall file for XTBP10 (Tableau Prep Introduction)
:: Version 1.1
:: Last update: 29 Jan 2020
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=XTBP10
SET SETUPDIR=%SETUPROOT%\%CLASSCODE%
SET LOGFILE=%SETUPROOT%\%CLASSCODE%_UninstallLog.log
SET CLASSDIR=C:\%CLASSCODE%ClassFiles

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Do uninstalls
cd %SETUPDIR%\Installers

echo Installing Tableau Prep
TableauPrep-2020-1-1.exe /uninstall /quiet

echo Installing Tableau Desktop
TableauDesktop-64bit-2019-4-1.exe /uninstall /quiet

:: Remove databases
echo Removing SQL Server databases
call %CLASSDIR%\Setup\DropDBs.cmd

:: Delete stuff
cd %SETUPROOT%
rmdir /s /q %SETUPDIR%
del %SETUPROOT%\%CLASSCODE%.zip

rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%