@echo off

SET SETUPDIR=%SETUPROOT%\BPBINT

echo Beginning setup of BPBINT

:: Download BI Data
echo Downloading BI Data
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\DownloadFile.ps1 -fileUrl "https://onlcsetup.blob.core.windows.net/setupfiles/BIData.zip" -destinationPath  %SETUPDIR%\Archives\BIData.zip"

:: Extract archives
echo Extracting archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Install Power BI Desktop
echo Installing Power BI Desktop
%SETUPDIR%\PBIDesktopSetup_x64.exe -q ACCEPT_EULA=1

echo Setup complete