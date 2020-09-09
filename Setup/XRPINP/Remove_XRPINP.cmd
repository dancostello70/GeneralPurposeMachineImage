::@echo off
:: Uninstall file for XRPINP ()
:: Version 1.0
:: Last update: 8 Sep 2020
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=XRPINP
SET SETUPDIR=%SETUPROOT%\%CLASSCODE%
SET LOGFILE=%SETUPROOT%\%CLASSCODE%_UninstallLog.log
SET CLASSDIR=C:\%CLASSCODE%ClassFiles

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Do uninstalls
cd %SETUPDIR%\Installers

echo Uninstalling Tableau Desktop
TableauDesktop-64bit-2020-3-0.exe /uninstall /quiet

echo Uninstalling Power BI Desktop
PBIDesktopSetup_x64.exe /uninstall /quiet

echo Uninstalling RStudio
%ProgramFiles%\RStudio\Uninstall.exe /S

echo Uninstalling MRAN
microsoft-r-open-3.5.3.exe /uninstall /quiet

:: Delete stuff
cd %SETUPROOT%
rmdir /s /q %SETUPDIR%
del %SETUPROOT%\%CLASSCODE%.zip

rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%