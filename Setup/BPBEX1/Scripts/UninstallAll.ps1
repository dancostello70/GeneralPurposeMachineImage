param($SetupRoot, $ClassSetupDir)

$setupDir = $("$SetupRoot/$ClassSetupDir")
$installersDir = $("$setupDir/Installers")

$fileAssets = ConvertFrom-Json -InputObject $(Get-Content $("$setupDir/FileAssets.json") | Out-String )

# Uninstall
foreach($item in $fileAssets){
    if ($item.relativeUninstallCommand.Length -gt 0) {
        Write-Host ("Uninstalling: {0}" -f $item.title)
        Invoke-Expression ("&{0}\{1}" -f $installersDir, $item.relativeUninstallCommand)
    }

    if ($item.uninstallCommand.Length -gt 0) {
        Write-Host ("Uninstalling: {0}" -f $item.title)
        Invoke-Expression ("&{0}" -f $item.uninstallCommand)
    }
}

# Give it ten seconds
Start-Sleep -Seconds 10