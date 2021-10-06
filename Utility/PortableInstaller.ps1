$classIdToInstall = Read-Host -Prompt "Please enter class id to install"


$downloadURL = "https://onlcsetup.blob.core.windows.net/setupfiles/"
$setupRoot = $env:SETUPROOT

if ($setupRoot.Length -eq 0) {
    $setupRoot = "C:\Setup"
    }

if ( !Test-Path $setupRoot ) {
    mkdir $setupRoot
    }
    
# Make a new webclient
$wc = New-Object System.Net.WebClient

# Switch to the setup directory
Set-Location $setupRoot

# Download the archive with all setup files
Write-Host
Write-Host "Downloading setup files"

$setupArchive = $classIdToInstall + ".zip"
$wc.DownloadFile("$downloadURL$setupArchive", "$setupRoot\$setupArchive")

# Extract the archive

Write-Host
Write-Host "Expanding archive"
Expand-Archive -Force -Path "$setupRoot\$setupArchive" -DestinationPath $setupRoot/

# Write setup kickoff
("call {0}\{1}\DoSetup.cmd" -f "%SETUPROOT%", $classIdToInstall) | Out-File -Encoding ascii "$setupRoot/StartSelectedClassSetup.cmd"

Invoke-Expression -Command ("{0}\{1}\DoSetup.cmd" -f $setupRoot,$classIdToInstall)