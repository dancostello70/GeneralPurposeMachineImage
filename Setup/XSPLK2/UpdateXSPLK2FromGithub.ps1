$ArchiveURI = "https://github.com/CostelloTechnicalConsulting/XSPLK2ClassFiles/archive/master.zip"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\xpcf.zip

Expand-Archive -Force -Path $env:TEMP\xpcf.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\XSPLK2ClassFiles-master\* C:\XSPLK2ClassFiles\

Remove-Item -Force -Recurse $env:TEMP\xpcf.zip
Remove-Item -Force -Recurse $env:TEMP\XSPLK2ClassFiles-master