# get temp directory from system environment variables
$archiveDir = $env:TEMP


$fa = ConvertFrom-Json -InputObject $(Get-Content $("./CourseFileAssets.json") | Out-String)
for ($i = 0; $i -lt $fa.Length; $i++) { Write-Host "$i $($fa[$i].title)" }

# Get the number of the file to install from the user
$selectedFile = Read-Host "Please enter the number of the file you want to install"
$item = $fa[$selectedFile]

if ($item.downloadURL.Length -gt 0) {


    # get the file name from the URL
    $fileName = Split-Path $item.downloadURL -Leaf
    $destinationFile = ("{0}\{1}" -f $archiveDir, $fileName)

    # Download to the archive directory
    Write-Host ("Downloading: {0}" -f $item.title)
    while (!(Test-Path -Path $destinationFile)) {
        Start-BitsTransfer -Source $item.downloadURL -Destination $destinationFile
        Start-Sleep -Seconds 5
    }

    # Extract
    $extractTarget = $item.extractTarget
    Write-Host ("Extracting: {0}" -f $item.title)
    Expand-Archive -Force -Path ("{0}\{1}" -f $archiveDir, $fileName) -DestinationPath ("{0}/" -f $extractTarget)

    # Install if there's an install command
    if ($item.installCommand.Length -gt 0) {
        $item.installCommand | Invoke-Expression
    }


}