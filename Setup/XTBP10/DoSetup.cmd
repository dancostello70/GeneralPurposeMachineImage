@echo off

SET SETUPDIR=%SETUPROOT%\XTBP10
SET CLASSDIR=C:\XTBP10ClassFiles

echo Beginning setup of XTBP10

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1


:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
cd %CLASSDIR%\Installers

echo Installing Tableau Prep
TableauPrep-2020-1-1.exe /quiet /norestart /log %SETUPDIR%\TableauPrepSetupLog.log ACCEPTEULA=1

echo Installing Tableau Desktop
TableauDesktop-64bit-2019-4-1.exe /quiet /norestart /log %SETUPDIR%\TableauDesktopSetupLog.log ACCEPTEULA=1
