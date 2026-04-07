:: This script lives at https://ctcdownloads.blob.core.windows.net/onlc/InstallBPBEX1.cmd

:: Use PowerShell to download a file from a URL
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ctcdownloads.blob.core.windows.net/onlc/BPBEX1_StudentFiles.zip', 'C:\Users\Student\BPBEX1_StudentFiles.zip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ctcdownloads.blob.core.windows.net/installers/PBIDesktopSetup_x64_2-100_2022-02-04.exe', 'C:\Users\Student\PBIDesktopSetup_x64_2-100_2022-02-04.exe')"
:: Use PowerShell to extract a ZIP file
powershell -Command "Expand-Archive -Path 'C:\Users\Student\BPBEX1_StudentFiles.zip' -DestinationPath 'C:\Users\Student\Desktop'"

C:\Users\Student\PBIDesktopSetup_x64_2-100_2022-02-04.exe -q ACCEPT_EULA=1

