
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\CS_DP200

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/AzureDataClassFiles.zip -localDownloadPath %TEMP%\AzureDataClassFiles.zip -extractTargetPath C:\AzureDataClassFiles
