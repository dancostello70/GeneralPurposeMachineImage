$setupPath = "$PSScriptRoot\Setup"
$sourcePath = "$PSScriptRoot\ImageComponents"
$AzCopyParams="sv=2020-04-08&se=2021-05-02T18%3A46%3A45Z&sr=c&sp=rwl&sig=KKt7pyIok1a5Vk1UaUJkAAURQMLTz1Tdg8xCIfbyCss%3D" 
$env:AZCOPY_CRED_TYPE = "";



cd $sourcePath

$env:AZCOPY_CRED_TYPE = "Anonymous";


if($true){

$classId = "BDXM01"


    Compress-Archive -Force D:\Data\* -DestinationPath D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01_Data.zip
    # Upload
    C:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01_Data.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01_Data.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

    Compress-Archive -Force D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ImageComponents\BDXM01_PBI\* -DestinationPath D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01_PBI.zip
    # Upload
    C:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01_PBI.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01_PBI.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

    Compress-Archive -Force D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ImageComponents\BDXM01LabMaterials\* -DestinationPath D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01LabMaterials.zip
    # Upload
    C:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ZipArchives\BDXM01LabMaterials.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/BDXM01LabMaterials.zip?$AzCopyParams" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
}


if($false){

$classId = "ADA100"

    Compress-Archive -Force D:\DA100\* -DestinationPath 
    # Upload
    C:/Utility/azcopy.exe copy "" "https://onlcsetup.blob.core.windows.net/setupfiles/____________________.zip?sv=2019-12-12&se=2021-03-14T01%3A57%3A11Z&sr=c&sp=rwl&sig=C%2B2FxB32w6xRsxoNdV%2Bug17NKdqCG%2BJSGwuvvXjFOeI%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
}


if($false){

$classId = "CS_DP200"

    Compress-Archive -Force D:\DC\Clients\ONLC\Projects\CustomTraining\20200210BrooksourceDP200\AzureDataClassFiles\* -DestinationPath D:\DC\Clients\ONLC\Projects\CustomTraining\20200210BrooksourceDP200\AzureDataClassFiles.zip
    # Upload
    C:/Utility/azcopy.exe copy "D:\DC\Clients\ONLC\Projects\CustomTraining\20200210BrooksourceDP200\AzureDataClassFiles.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/AzureDataClassFiles.zip?sv=2019-12-12&se=2021-03-14T01%3A57%3A11Z&sr=c&sp=rwl&sig=C%2B2FxB32w6xRsxoNdV%2Bug17NKdqCG%2BJSGwuvvXjFOeI%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
}

if($false){

$classId = "XSPLK1"

    Compress-Archive -Force ./$classId/ArchiveSource/C_XSPLK1ClassFiles/* -DestinationPath $setupPath/$classId/Archives/C_XSPLK1ClassFiles.zip
    Compress-Archive -Force ./$classId/ArchiveSource/C_splunk-essentials-master/* -DestinationPath $setupPath/$classId/Archives/C_splunk-essentials-master.zip

}

if($false){

    $classId = "20778C"




    #Compress-Archive ./20778C -DestinationPath "$targetPath/20778C.zip"
    #Compress-Archive ./BPBINT -DestinationPath "$targetPath/BPBINT.zip"
#Compress-Archive ./XSPLK1 -DestinationPath "$targetPath/XSPLK1.zip"
}

if($false){

    $classId = "XSPLK2"

    Compress-Archive -Force C:/XSPLK2ClassFiles/* -DestinationPath $setupPath/$classId/Archives/C_XSPLK2ClassFiles.zip
    Compress-Archive -Force C:/Improving-your-Splunk-skills-master/* -DestinationPath $setupPath/$classId/Archives/C_Improving-your-Splunk-skills-master.zip

}

$env:AZCOPY_CRED_TYPE = "";