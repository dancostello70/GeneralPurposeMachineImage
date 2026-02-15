
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\__ClassID__

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/D_DA100_Original.zip -localDownloadPath %TEMP%\D_DA100_Original.zip -extractTargetPath D:\DA100_Original
powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/D_DA100_Feb2021.zip -localDownloadPath %TEMP%\D_DA100_Feb2021.zip -extractTargetPath D:\DA100
