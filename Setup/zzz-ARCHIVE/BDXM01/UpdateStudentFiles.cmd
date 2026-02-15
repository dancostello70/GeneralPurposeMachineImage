
IF "%SETUPROOT%"=="" SET SETUPROOT=C:\Setup
SET SETUPDIR=%SETUPROOT%\BDXM01

powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01LabMaterials.zip -localDownloadPath %TEMP%\BDXM01LabMaterials.zip -extractTargetPath C:\Users\Student\Desktop\BDXM01LabMaterials
powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01_PBI.zip -localDownloadPath %TEMP%\BDXM01_PBI.zip -extractTargetPath C:\Users\Student\Desktop\BDXM01_PBI
powershell -ExecutionPolicy Bypass -File %~dp0\Scripts\DownloadAndExtract.ps1 -URL https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01_Data.zip -localDownloadPath %TEMP%\BDXM01_Data.zip -extractTargetPath D:\Data
