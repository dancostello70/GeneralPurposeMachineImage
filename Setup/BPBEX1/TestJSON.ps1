$myVar = ConvertFrom-Json -InputObject $(Get-Content "./TestFile.json" | Out-String )
Write-Host $myVar.Count

foreach($item in $myVar ){
    Write-Host $item.title
    if ($item.installCommand.Length -gt 0) {
        Write-Host $item.installCommand
    }
}