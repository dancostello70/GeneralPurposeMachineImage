::@echo off
:: Uninstall file for CS_DP200 (CareSource Introduction to Azure Data Technologies)
:: Version 1.0
:: Last update: __DATE__
:: Author: Dan Costello (dan@costellotech.com)

SET CLASSCODE=CS_DP200
SET SETUPDIR=%SETUPROOT%\%CLASSCODE%
SET LOGFILE=%SETUPROOT%\%CLASSCODE%_UninstallLog.log
SET CLASSDIR=C:\%CLASSCODE%ClassFiles

:: Start log
echo Beginning uninstall > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

:: Do uninstalls
cd %SETUPDIR%\Installers

echo Uninstalling Power BI Desktop
PBIDesktopSetup_x64.exe -uninstall -q

:: Delete stuff
:: Desktop files
cd %USERPROFILE%\Desktop\
del "Class Files.lnk"
del "Course GitHub Site.URL"
del "Course Handbook.URL"



cd %SETUPROOT%
rmdir /s /q %SETUPDIR%
del %SETUPROOT%\%CLASSCODE%.zip

rmdir /s /q %CLASSDIR%


:: Log process complete
echo Uninstall completed >> %LOGFILE%
time /t >> %LOGFILE%