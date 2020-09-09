﻿# Download files for BPBEX1 (Power BI for Excel Users)
param($ClassId)

$selectedClassId = $ClassId
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"

$fileList = Import-Csv "$classSetupRoot\FileDownloadList.csv"

foreach($f in $fileList){
    Write-Host "Downloading file $($f.FileName)"
    Invoke-WebRequest -UseBasicParsing -Uri $f.URI -OutFile ("{0}\Archives\{1}" -f $classSetupRoot,$f.FileName)
}
