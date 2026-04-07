:: This script lives at https://ctcdownloads.blob.core.windows.net/onlc/InstallBPBEX1.cmd

:: Use PowerShell to download a file from a URL
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ctcdownloads.blob.core.windows.net/onlc/PL300_Allfiles_20240204.zip', 'D:\PL300_Allfiles_20240204.zip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ctcdownloads.blob.core.windows.net/installers/PBIDesktopSetup_x64_2-120_2023-09-09.exe', 'D:\PBIDesktopSetup_x64_2-120_2023-09-09.exe')"
:: Use PowerShell to extract a ZIP file
powershell -Command "Expand-Archive -Path 'D:\PL300_Allfiles_20240204.zip' -DestinationPath 'D:\'"

D:\PBIDesktopSetup_x64_2-120_2023-09-09.exe -q ACCEPT_EULA=1

REM - Restart SQL Server Service to force closure of any open connections
NET STOP SQLSERVERAGENT /y
NET STOP MSSQLSERVER /y
NET START MSSQLSERVER /y
NET START SQLSERVERAGENT /y

REM - Run SQL Script to prepare the database environment
ECHO Preparing Databases...
SQLCMD -E -Q "RESTORE DATABASE [AdventureWorksDW2020] FROM DISK = N'D:\Allfiles\DatabaseBackup\AdventureWorksDW2020.bak' WITH FILE = 1, NOUNLOAD, STATS = 5"
SQLCMD -E -Q "RESTORE DATABASE [TailspinToys2020-US] FROM DISK = N'D:\Allfiles\DatabaseBackup\TailspinToys2020-US.bak' WITH FILE = 1, NOUNLOAD, STATS = 5"
