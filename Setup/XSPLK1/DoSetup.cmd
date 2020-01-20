@echo off

SET SETUPDIR=%SETUPROOT%\XSPLK1

echo Beginning setup of XSPLK1

:: Extract archives
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\ExtractArchives.ps1


:: Copy Desktop Files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\
