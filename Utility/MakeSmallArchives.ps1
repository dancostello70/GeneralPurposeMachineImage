$sourcePath = "$PSScriptRoot\ImageComponents"
$targetPath = "$PSScriptRoot\DeploymentPackages"

cd $sourcePath

$classId = "XSPLK1"

Compress-Archive -Force -Path ./$classId/ArchiveSource/C_XSPLK1ClassFiles/Assets, ./$classId/ArchiveSource/C_XSPLK1ClassFiles/Logs, ./$classId/ArchiveSource/C_XSPLK1ClassFiles/ppt, ./$classId/ArchiveSource/C_XSPLK1ClassFiles/Scripts -DestinationPath $targetPath/XSPLK1ClassFiles.zip
