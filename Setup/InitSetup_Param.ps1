param($ClassId)

$selectedClassId = $ClassId
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"


$downloadURL = "https://onlcsetup.blob.core.windows.net/setupfiles/"
$setupRoot = $env:SETUPROOT

# Switch to the setup directory
cd $setupRoot

    # Download the archive with all setup files
    Write-Host
    Write-Host "Downloading setup files"

    $setupArchive = $selectedClassId + ".zip"
    Invoke-WebRequest -UseBasicParsing -Uri "$downloadURL$setupArchive" -OutFile "$setupRoot\$setupArchive"

    # Extract the archive

    Write-Host
    Write-Host "Expanding archive"
    Expand-Archive -Force -Path "$setupRoot\$setupArchive" -DestinationPath $setupRoot/

    # Write setup kickoff
    ("call {0}\{1}\DoSetup.cmd" -f "%SETUPROOT%", $selectedClass.ClassId) | Out-File -Encoding ascii "$setupRoot/StartSelectedClassSetup.cmd"
    