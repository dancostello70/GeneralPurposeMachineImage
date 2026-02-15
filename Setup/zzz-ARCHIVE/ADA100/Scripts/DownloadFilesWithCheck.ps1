# Download files for ADA100 (Analyzing Data with Power BI)
param($ClassId)

$selectedClassId = $ClassId
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"

$fileList = Import-Csv "$classSetupRoot\FileDownloadList.csv"

foreach($f in $fileList){
    Write-Host "Downloading file $($f.FileName)"
    # Invoke-WebRequest -UseBasicParsing -Uri $f.URI -OutFile ("{0}\Archives\{1}" -f $classSetupRoot,$f.FileName)
    $targetPath = ("{0}\Archives\{1}" -f $classSetupRoot,$f.FileName)
    while(!(Test-Path -Path $targetPath)){
        Start-BitsTransfer -Source $f.URI -Destination $targetPath
        Start-Sleep -Seconds 5
    }
     
}
