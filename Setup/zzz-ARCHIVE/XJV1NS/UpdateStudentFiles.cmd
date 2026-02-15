
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\XJV1NS

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/XJV1NS_C_code.zip -localDownloadPath %TEMP%\XJV1NS_C_code.zip -extractTargetPath C:\code
