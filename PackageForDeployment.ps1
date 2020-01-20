$setupPath = "$PSScriptRoot\Setup"
$targetPath = "$PSScriptRoot\DeploymentPackages"

cd $setupPath

#Compress-Archive -Force ./20778C -DestinationPath "$targetPath/20778C.zip"
#Compress-Archive -Force ./BPBINT -DestinationPath "$targetPath/BPBINT.zip"
#Compress-Archive -Force ./XSPLK1 -DestinationPath "$targetPath/XSPLK1.zip"
Compress-Archive -Force ./XSPLK2 -DestinationPath "$targetPath/XSPLK2.zip"