# Download files for XALINS (Alteryx Concepts - Level 1)
param($URL, $localDownloadPath, $extractTargetPath)


    Write-Host "Downloading file $($URL)"
    Invoke-WebRequest -UseBasicParsing -Uri $URL -OutFile $localDownloadPath
    
    Write-Host "Extracting $($localDownloadPath)"
    Expand-Archive -Force -Path $localDownloadPath -DestinationPath $extractTargetPath