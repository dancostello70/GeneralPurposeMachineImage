
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\CS_DP200

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/C_CS_DP200ClassFiles.zip -localDownloadPath %TEMP%\C_CS_DP200ClassFiles.zip -extractTargetPath C:\CS_DP200ClassFiles
