param($PatchFile)


https://github.com/dancostello70/GeneralPurposeMachineImage/raw/master/Patches/20201030Demo.cmd

$downloadURL = "https://onlcsetup.blob.core.windows.net/setupfiles/"
$setupRoot = $env:SETUPROOT
$setupMenuFile =  "SetupMenu.txt"

# Make a new webclient
$wc = New-Object System.Net.WebClient

# Switch to the setup directory
cd $setupRoot

# Get the setup menu
$wc.DownloadFile("$downloadURL$setupMenuFile", "$setupRoot\$setupMenuFile")

# Prompt user
Clear-Host

$classList = import-csv -Header ClassName,ClassId "$setupRoot\$setupMenuFile"

foreach($c in $classList){Write-Host $c.ClassName}

Write-Host

$userSelection = Read-Host "Please select a class by number and press [Enter]"


# Assuming a number was selected, make that the index of the class
if ($userSelection -match "^[\d\.]+$"){
    $selectedClass = $classList[$userSelection - 1]

    Write-Host
    Write-Host "Selected class:" $selectedClass.ClassName

    # Set an environment variable
    # [System.Environment]::SetEnvironmentVariable('SELECTEDCLASSID',($selectedClass.ClassId),'Machine')

    # Download the archive with all setup files
    Write-Host
    Write-Host "Downloading setup files"

    $setupArchive = $selectedClass.ClassId + ".zip"
    $wc.DownloadFile("$downloadURL$setupArchive", "$setupRoot\$setupArchive")

    # Extract the archive

    Write-Host
    Write-Host "Expanding archive"
    Expand-Archive -Force -Path "$setupRoot\$setupArchive" -DestinationPath $setupRoot/

    # Write setup kickoff
    ("call {0}\{1}\DoSetup.cmd" -f "%SETUPROOT%", $selectedClass.ClassId) | Out-File -Encoding ascii "$setupRoot/StartSelectedClassSetup.cmd"
    

} else {
    Write-Host "Sorry, invalid class selection..."
}