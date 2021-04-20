$setupPath = "$PSScriptRoot\Setup"
$bigFilesPath = "$PSScriptRoot\BigFiles"
$zipArchivePath = "$PSScriptRoot\ZipArchives"
$targetPath = "$PSScriptRoot\DeploymentPackages"
$imageComponentsPath = "$PSScriptRoot\ImageComponents\XSPLK2\ArchiveSource"
$AzCopyParams="sv=2020-04-08&se=2021-05-02T18%3A46%3A45Z&sr=c&sp=rwl&sig=KKt7pyIok1a5Vk1UaUJkAAURQMLTz1Tdg8xCIfbyCss%3D" 


cd $setupPath

# Master files

#Compress-Archive -Force ./20778C -DestinationPath "$targetPath/20778C.zip"
#Compress-Archive -Force ./BPBINT -DestinationPath "$targetPath/BPBINT.zip"
#Compress-Archive -Force ./XSPLK1 -DestinationPath "$targetPath/XSPLK1.zip"
#Compress-Archive -Force ./XSPLK2 -DestinationPath "$targetPath/XSPLK2.zip"
#Compress-Archive -Force ./XTBP10 -DestinationPath "$targetPath/XTBP10.zip"
#Compress-Archive -Force ./XSQL01 -DestinationPath "$targetPath/XSQL01.zip"
#Compress-Archive -Force ./BPBEX1 -DestinationPath "$targetPath/BPBEX1.zip"
#Compress-Archive -Force ./XRPINP -DestinationPath "$targetPath/XRPINP.zip"
Compress-Archive -Force ./ADA100 -DestinationPath "$targetPath/ADA100.zip"
#Compress-Archive -Force ./XALINS -DestinationPath "$targetPath/XALINS.zip"
#Compress-Archive -Force ./CS_DP200 -DestinationPath "$targetPath/CS_DP200.zip"
#Compress-Archive -Force ./BDXM01 -DestinationPath "$targetPath/BDXM01.zip"

$env:AZCOPY_CRED_TYPE = "Anonymous";

# c:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\XALINS.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XALINS.zip?sv=2019-12-12&se=2021-02-28T21%3A18%3A44Z&sr=c&sp=rwl&sig=ex7vUkj1BF3Ak%2FyX6WPuYO0wtgP%2FWE4h9hZz1oShB4k%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# CS_DP200
# c:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\CS_DP200.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/CS_DP200.zip?sv=2019-12-12&se=2021-02-28T21%3A18%3A44Z&sr=c&sp=rwl&sig=ex7vUkj1BF3Ak%2FyX6WPuYO0wtgP%2FWE4h9hZz1oShB4k%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# ADA100
c:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\ADA100.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/ADA100.zip?sv=2019-12-12&se=2021-04-03T20%3A15%3A49Z&sr=c&sp=rwl&sig=c7wbSYZO6sFefBKWZ40Q0nDOeb7%2FJr58nSZ4nnDwmgQ%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# BDXM01
#c:/Utility/azcopy.exe copy "$targetPath\BDXM01.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# XALINS
#c:/Utility/azcopy.exe copy "$targetPath\XALINS.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XALINS.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;


$env:AZCOPY_CRED_TYPE = "";



cd $bigFilesPath

# Support archives
#Compress-Archive -Force ./Setup_XSPLK2_Installers/* -DestinationPath "$zipArchivePath/Setup_XSPLK2_Installers.zip"
#Compress-Archive -Force ./c_XSPLK2ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XSPLK2ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_1/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_1.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_2/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_2.zip"
#Compress-Archive -Force ./c_XTBP10ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XTBP10ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_ANY_Installers_TableauServer/* -DestinationPath "$zipArchivePath/Setup_ANY_Installers_TableauServer.zip"


cd $setupPath