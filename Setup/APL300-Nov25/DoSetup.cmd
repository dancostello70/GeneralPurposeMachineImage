@echo off
:: Setup file for APL300 (PL-300: Microsoft Power BI Data Analyst)
:: Version 4.0
:: Target Power BI Desktop Version: 2-149 (Nov 25)
:: Last update: 2026-04-06
:: Author: Dan Costello (dan@costellotech.com)

IF "%SETUPROOT%"=="" (SET SETUPROOT=C:\Setup)
SET CLASSID=APL300-Nov25
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=D:\Allfiles
SET PL300DIR=D:\PL-300-Microsoft-Power-BI-Data-Analyst
SET DOWNLOADSDIR=C:\Users\Student\Downloads


:: Start log
echo Beginning setup > %LOGFILE%
date /t >> %LOGFILE%
time /t >> %LOGFILE%

echo Beginning setup of %CLASSID%

powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadExtractInstall.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%

echo Download setup install complete >> %LOGFILE%
time /t >> %LOGFILE%

:: Clone repo to PL-300-Microsoft-Power-BI-Data-Analyst directory
echo Cloning PL-300 GitHub repository
"%PROGRAMFILES%\Git\cmd\git.exe" clone https://github.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst.git %PL300DIR%

:: Copy all zip files in all subdirectories of D:\PL-300-Microsoft-Power-BI-Data-Analyst-Main\Allfiles\Labs directly into Downloads (no subfolders)
echo Copying lab zip files to Downloads folder
if not exist "%DOWNLOADSDIR%" mkdir "%DOWNLOADSDIR%"
for /R "%PL300DIR%\Allfiles\Labs" %%F in (*.zip) do copy /Y "%%F" "%DOWNLOADSDIR%"

:: Extract all zip files in Downloads
echo Extracting lab zip files in Downloads folder
cd "%DOWNLOADSDIR%"
powershell -ExecutionPolicy Bypass -Command "Get-ChildItem %DOWNLOADSDIR%\[01]*.zip | foreach{ Expand-Archive $_ -Force }"
cd %SETUPDIR%

:: Install databases
:: 2024-07-09 updated to add Allfiles\DBData directory for PL300
echo Setting up SQL Server databases
call %SETUPDIR%\Scripts\SetupDbs.cmd

:: Copy Desktop Files
echo Copying desktop files
xcopy /Y %SETUPDIR%\Desktop\*.* %USERPROFILE%\Desktop\

:: Change the Execution Policy
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SetExecutionPolicy.ps1 

:: Send an alert
powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\SendAlert.ps1 -ClassId %CLASSID%

:: Log process complete
echo Setup completed >> %LOGFILE%
time /t >> %LOGFILE%