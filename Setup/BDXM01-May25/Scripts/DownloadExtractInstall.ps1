# Updated 2026-02-15
# Added psInstallCommand and psUninstallCommand to the FileAssets.json for BDXM01-May25, 
# and updated the DownloadExtractInstall.ps1 script to execute those commands. 

param($SetupRoot, $ClassSetupDir)

$setupDir = $("$SetupRoot/$ClassSetupDir")
$archiveDir = $("$setupDir/Archives")
$installersDir = $("$setupDir/Installers")

$fileAssets = ConvertFrom-Json -InputObject $(Get-Content $("$setupDir/FileAssets.json") | Out-String )

# Download and extract
foreach($item in $fileAssets){
    $fileName = Split-Path $item.downloadURL -Leaf
    $destinationFile = ("{0}\{1}" -f $archiveDir,$fileName)
    $extractTarget = @{$true=("{0}\{1}" -f $setupDir, $item.relativeExtractTarget); $false=$item.extractTarget}[$item.relativeExtractTarget.Length -gt 0]
    # Download to the archive directory
    Write-Host ("Downloading: {0}" -f $item.title)
    while(!(Test-Path -Path $destinationFile)){
        Start-BitsTransfer -Source $item.downloadURL -Destination $destinationFile
        Start-Sleep -Seconds 5
    }

    # Extract
    Write-Host ("Extracting: {0}" -f $item.title)
    Expand-Archive -Force -Path ("{0}\{1}" -f $archiveDir,$fileName) -DestinationPath ("{0}/" -f $extractTarget)
}

# Install
foreach($item in $fileAssets){
    if ($item.installCommand.Length -gt 0) {
        Write-Host ("Installing: {0}" -f $item.title)
        Invoke-Expression ("{0}\{1}" -f $installersDir, $item.installCommand)
    }
    if ($item.psInstallCommand.Length -gt 0) {
        Write-Host ("Installing: {0}" -f $item.title)
        Invoke-Expression ("{0}" -f $item.psInstallCommand)
    }
}
