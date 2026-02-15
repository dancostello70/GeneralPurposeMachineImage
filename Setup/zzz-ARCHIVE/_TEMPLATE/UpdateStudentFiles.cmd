
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\__ClassID__

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/C___ClassID__ClassFiles.zip -localDownloadPath %TEMP%\C___ClassID__ClassFiles.zip -extractTargetPath C:\__ClassID__ClassFiles
