# Update class files for XRPINP (R Programming Introduction)
param($ClassId)

$selectedClassId = $ClassId

$repoName = "XRPINPClassFiles"
$ArchiveURI = "https://github.com/CostelloTechnicalConsulting/$repoName/archive/master.zip"
$targetDir = "C:\" + $selectedClassId + "ClassFiles\"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\repo_temp.zip

Expand-Archive -Force -Path $env:TEMP\repo_temp.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\$repoName-master\$repoName\* $targetDir

Remove-Item -Force -Recurse $env:TEMP\repo_temp.zip
Remove-Item -Force -Recurse $env:TEMP\$repoName-master