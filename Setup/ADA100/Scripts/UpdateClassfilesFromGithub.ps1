# Update class files for  ADA100 (Analyzing Data with Power BI)
param($ClassId)

$selectedClassId = $ClassId

$repoName = "DA-100-Analyzing-Data-with-Power-BI"
$ArchiveURI = "https://github.com/MicrosoftLearning/$repoName/archive/master.zip"
$targetDir = "D:\DA100\"

Write-Host "Repo Name $repoName"

Invoke-WebRequest -UseBasicParsing -Uri $ArchiveURI -OutFile $env:TEMP\repo_temp.zip

Expand-Archive -Force -Path $env:TEMP\repo_temp.zip -DestinationPath $env:TEMP\

xcopy /c /e /y $env:TEMP\$repoName-master\Allfiles\DA-100-Allfiles\* $targetDir

# Remove-Item -Force -Recurse $env:TEMP\repo_temp.zip
# Remove-Item -Force -Recurse $env:TEMP\$repoName-master