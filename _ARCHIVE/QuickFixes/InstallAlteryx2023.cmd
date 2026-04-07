@echo off

set URL=https://onlcsetup.blob.core.windows.net/installers/AlteryxNonAdminInstallx64_2023.2.1.89.exe
set FILENAME=AlteryxNonAdminInstallx64_2023.2.1.89.exe

echo Downloading %FILENAME%...
powershell -Command "Start-BitsTransfer -Source %URL% -Destination %FILENAME%"

echo Download completed.

AlteryxNonAdminInstallx64_2023.2.1.89.exe /s /l=%SETUPDIR%\AlteryxInstallLog.log