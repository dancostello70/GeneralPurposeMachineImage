$setupPath = "$PSScriptRoot\Setup"
$bigFilesPath = "$PSScriptRoot\BigFiles"
$zipArchivePath = "$PSScriptRoot\ZipArchives"
$targetPath = "$PSScriptRoot\DeploymentPackages"
$imageComponentsPath = "$PSScriptRoot\ImageComponents\XSPLK2\ArchiveSource"


cd $setupPath

# Master files

#Compress-Archive -Force ./20778C -DestinationPath "$targetPath/20778C.zip"
#Compress-Archive -Force ./BPBINT -DestinationPath "$targetPath/BPBINT.zip"
#Compress-Archive -Force ./XSPLK1 -DestinationPath "$targetPath/XSPLK1.zip"
Compress-Archive -Force ./XSPLK2 -DestinationPath "$targetPath/XSPLK2.zip"

cd $bigFilesPath

# Support archives
#Compress-Archive -Force ./Setup_XSPLK2_Installers/* -DestinationPath "$zipArchivePath/Setup_XSPLK2_Installers.zip"
#Compress-Archive -Force ./c_XSPLK2ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XSPLK2ClassFiles_BIG.zip"
