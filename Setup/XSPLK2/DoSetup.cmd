@echo off
:: Setup file for XSPLK2 (Splunk Fundamentals Level 2)
:: Version 2.0
:: Author: Dan Costello (dan@costellotech.com)

SET SETUPDIR=%SETUPROOT%\XSPLK2

echo Beginning setup of XSPLK2

:: Download files
echo Downloading files
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\DownloadFiles.ps1

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1

:: Update from GitHub
echo Updating from GitHub
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\UpdateXSPLK2FromGithub.ps1

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Do installations
cd %SETUPDIR%\Installers

echo Installing Splunk Enterprise
msiexec.exe /I splunk-8.0.1-6db836e2fb9e-x64-release.msi SPLUNKUSERNAME=admin SPLUNKPASSWORD=password AGREETOLICENSE=Yes INSTALLDIR="C:\Splunk"  /quiet

echo Installing Java JRE
jre-8u231-windows-x64.exe /s


