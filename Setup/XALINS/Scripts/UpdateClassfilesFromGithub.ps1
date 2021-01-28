# Update class files for XALINS (Alteryx Concepts - Level 1)
param($ClassId)

$selectedClassId = $ClassId

$repoName = "__RepoName__"
$ArchiveURI = "https://github.com/CostelloTechnicalConsulting/$repoName/archive/master.zip"
$targetDir = "C:\$selectedClassIdClassFiles\"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\repo_temp.zip

Expand-Archive -Force -Path $env:TEMP\repo_temp.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\$repoName-master\* $targetDir

Remove-Item -Force -Recurse $env:TEMP\repo_temp.zip
Remove-Item -Force -Recurse $env:TEMP\$repoName-master