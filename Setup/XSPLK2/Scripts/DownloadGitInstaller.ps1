param($SetupRoot, $ClassSetupDir)

$setupDir = $("$SetupRoot/$ClassSetupDir")
$archiveDir = $("$setupDir/Archives")
$installersDir = $("$setupDir/Installers")

Start-BitsTransfer -Source "https://onlcsetup.blob.core.windows.net/installers/Git-2.42.0.2-64-bit.exe" -Destination "$setupDir\Installers\Git-2.42.0.2-64-bit.exe"

