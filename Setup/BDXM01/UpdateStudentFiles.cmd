
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\BDXM01

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01LabMaterials.zip -localDownloadPath %TEMP%\BDXM01LabMaterials.zip -extractTargetPath C:\Users\Student\Desktop\BDXM01LabMaterials
powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01Data.zip -localDownloadPath %TEMP%\BDXM01Data.zip -extractTargetPath D:\Data
