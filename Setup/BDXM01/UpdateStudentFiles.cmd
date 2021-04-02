
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\BDXM01

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/C_BDXM01ClassFiles.zip -localDownloadPath %TEMP%\C_BDXM01ClassFiles.zip -extractTargetPath C:\BDXM01ClassFiles
