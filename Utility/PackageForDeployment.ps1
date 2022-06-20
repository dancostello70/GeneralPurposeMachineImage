$rootDir = (Get-Item $PSScriptRoot).Parent.FullName

$setupPath = "$rootDir\Setup"
$bigFilesPath = "$rootDir\BigFiles"
$zipArchivePath = "$rootDir\ZipArchives"
$targetPath = "$rootDir\DeploymentPackages"
$imageComponentsPath = "$rootDir\ImageComponents\XSPLK2\ArchiveSource"
$AzCopyParams="sv=2020-10-02&se=2022-07-16T02%3A26%3A45Z&sr=c&sp=rwl&sig=nvgJbGPBNhv5zJ%2BlsyVOHAKIfjzmYzl7ku59CZijTzc%3D"

$classesToDeploy = (
    # "BPBEX1",
    # "A20779",
    # "BPBEX1_new",
    # "BPBINT",
    #"APL300",
    #"XSPLK2",
    "XALINS",
    "___END___"
)

$env:AZCOPY_CRED_TYPE = "Anonymous";
Set-Location $setupPath

foreach ($item in $classesToDeploy) {
    if ($item -ne "___END___") {
        Write-Host "Compresing $item"
        Compress-Archive -Force ./$item -DestinationPath "$targetPath/$item.zip"
        Write-Host "Uploading $item"
        c:/Utilities/azcopy.exe copy "$targetPath/$item.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/$item.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;    
    }    
}

$env:AZCOPY_CRED_TYPE = "";
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
#Compress-Archive -Force ./BDXM01n -DestinationPath "$targetPath/BDXM01n.zip"
#Compress-Archive -Force ./BPBEX1_new -DestinationPath "$targetPath/BPBEX1_new.zip"
#Compress-Archive -Force ./A20779 -DestinationPath "$targetPath/A20779.zip"#

# Lab files
#Compress-Archive -Force "c:\CourseFiles\DAXIntro" -DestinationPath "$targetPath/C_Coursefiles_DAXIntro.zip"

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
#c:/Utility/azcopy.exe copy "$targetPath\BDXM01n.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01n.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
#c:/Utility/azcopy.exe copy "$targetPath\C_Coursefiles_DAXIntro.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/C_Coursefiles_DAXIntro.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# BPBEX1
#c:/Utility/azcopy.exe copy "$targetPath/BPBEX1.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BPBEX1.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# BPBEX1_new
#c:/Utility/azcopy.exe copy "$targetPath/BPBEX1_new.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BPBEX1_new.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# A20779
#c:/Utility/azcopy.exe copy "$targetPath/A20779.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/A20779.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;


$env:AZCOPY_CRED_TYPE = "";



# Set-Location $bigFilesPath

# Support archives
#Compress-Archive -Force ./Setup_XSPLK2_Installers/* -DestinationPath "$zipArchivePath/Setup_XSPLK2_Installers.zip"
#Compress-Archive -Force ./c_XSPLK2ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XSPLK2ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_1/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_1.zip"
#Compress-Archive -Force ./Setup_XTBP10_Installers_2/* -DestinationPath "$zipArchivePath/Setup_XTBP10_Installers_2.zip"
#Compress-Archive -Force ./c_XTBP10ClassFiles_BIG/* -DestinationPath "$zipArchivePath/c_XTBP10ClassFiles_BIG.zip"
#Compress-Archive -Force ./Setup_ANY_Installers_TableauServer/* -DestinationPath "$zipArchivePath/Setup_ANY_Installers_TableauServer.zip"


Set-Location $setupPath