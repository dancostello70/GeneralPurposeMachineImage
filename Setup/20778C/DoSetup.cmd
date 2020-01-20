@echo off

SET SETUPDIR=%SETUPROOT%\20778C

echo Beginning setup of 20778C

echo Extracting archives
:: Extract archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1

echo Copying desktop files
:: Copy Desktop Files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

echo Installing Power BI Desktop
:: Install Power BI Desktop
%SETUPDIR%\Installers\PBIDesktopSetup_x64.exe -q ACCEPT_EULA=1

echo Setup complete