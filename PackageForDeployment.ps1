$setupPath = "$PSScriptRoot\Setup"
$bigFilesPath = "$PSScriptRoot\BigFiles"
$zipArchivePath = "$PSScriptRoot\ZipArchives"
$targetPath = "$PSScriptRoot\DeploymentPackages"
$imageComponentsPath = "$PSScriptRoot\ImageComponents\XSPLK2\ArchiveSource"
$AzCopyParams="sv=2020-04-08&se=2021-10-18T21%3A45%3A48Z&sr=c&sp=rwl&sig=YRIQxaDjBbjyFf%2FDIIVmhNAVtDHt%2BaLN3QMmFGoGhpw%3D" 



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
#Compress-Archive -Force ./ADA100 -DestinationPath "$targetPath/ADA100.zip"
#Compress-Archive -Force ./XALINS -DestinationPath "$targetPath/XALINS.zip"
#Compress-Archive -Force ./CS_DP200 -DestinationPath "$targetPath/CS_DP200.zip"
#Compress-Archive -Force ./BDXM01 -DestinationPath "$targetPath/BDXM01.zip"
Compress-Archive -Force ./BDXM01n -DestinationPath "$targetPath/BDXM01n.zip"

# Lab files
Compress-Archive -Force "c:\CourseFiles\DAXIntro" -DestinationPath "$targetPath/C_Coursefiles_DAXIntro.zip"

$env:AZCOPY_CRED_TYPE = "Anonymous";

# c:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\XALINS.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XALINS.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# CS_DP200
# c:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\CS_DP200.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/CS_DP200.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# ADA100
#c:/Utility/azcopy.exe copy "$targetPath\ADA100.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/ADA100.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# BDXM01
#c:/Utility/azcopy.exe copy "$targetPath\BDXM01.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# XALINS
#c:/Utility/azcopy.exe copy "$targetPath\XALINS.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XALINS.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# BDXM01n
c:/Utility/azcopy.exe copy "$targetPath\BDXM01n.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01n.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
c:/Utility/azcopy.exe copy "$targetPath\C_Coursefiles_DAXIntro.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/C_Coursefiles_DAXIntro.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;


$env:AZCOPY_CRED_TYPE = "";



#cd $bigFilesPath

# Support archives
#Compress-Archive -Force ./Setup_XSPLK2_Installers/* -DestinationPath "$zipArchivePath/Setup_XSPLK2_Installers.zip"
#Compress-Archive -Force ./c_XSPLK2ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XSPLK2ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_1/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_1.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_2/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_2.zip"
#Compress-Archive -Force ./c_XTBP10ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XTBP10ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_ANY_Installers_TableauServer/* -DestinationPath "$zipArchivePath/Setup_ANY_Installers_TableauServer.zip"


#cd $setupPath