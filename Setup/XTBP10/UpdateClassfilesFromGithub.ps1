# Update class files for XTBP10 (Tableau Prep Introduction)

$repoName = "XTBP10---Tableau-Prep-Introduction"
$ArchiveURI = "https://github.com/CostelloTechnicalConsulting/$repoName/archive/master.zip"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\repo_temp.zip

Expand-Archive -Force -Path $env:TEMP\repo_temp.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\$repoName-master\* C:\XTBP10ClassFiles\

Remove-Item -Force -Recurse $env:TEMP\repo_temp.zip
Remove-Item -Force -Recurse $env:TEMP\$repoName-master