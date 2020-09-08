$ArchiveURI = "https://github.com/CostelloTechnicalConsulting/XSPLK2ClassFiles/archive/master.zip"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\xpcf.zip

<<<<<<< HEAD
Expand-Archive -Force -Path $env:TEMP\xpcf.zip -DestinationPath c:\

xcopy /e /y C:\XSPLK2ClassFiles-master\* C:\XSPLK2ClassFiles\

Remove-Item -Force -Recurse $env:TEMP\xpcf.zip
Remove-Item -Force -Recurse C:\XSPLK2ClassFiles-master
=======
Expand-Archive -Force -Path $env:TEMP\xpcf.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\XSPLK2ClassFiles-master\* C:\XSPLK2ClassFiles\

Remove-Item -Force -Recurse $env:TEMP\xpcf.zip
Remove-Item -Force -Recurse $env:TEMP\XSPLK2ClassFiles-master
>>>>>>> 1294f3effe714f27a6261bf44e511f74e4ee2ad4
