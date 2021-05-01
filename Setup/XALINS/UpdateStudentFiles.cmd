
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\XALINS

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/C_XALINSClassFiles.zip -localDownloadPath %TEMP%\C_XALINSClassFiles.zip -extractTargetPath C:\XALINSClassFiles
powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/C_XAL2NSClassFiles.zip -localDownloadPath %TEMP%\C_XAL2NSClassFiles.zip -extractTargetPath C:\XAL2NSClassFiles
