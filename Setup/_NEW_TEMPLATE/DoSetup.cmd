

IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET CLASSID=__ClassID__
SET SETUPDIR=%SETUPROOT%\%CLASSID%
SET LOGFILE=%SETUPDIR%\SetupLog.log
SET CLASSDIR=C:\%CLASSID%ClassFiles


powershell -ExecutionPolicy Bypass -File %SETUPDIR%\Scripts\DownloadExtractInstall.ps1 -SetupRoot %SETUPROOT% -ClassSetupDir %CLASSID%