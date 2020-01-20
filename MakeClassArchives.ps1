$setupPath = "$PSScriptRoot\Setup"
$sourcePath = "$PSScriptRoot\ImageComponents"

cd $sourcePath

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

if($true){

    $classId = "XSPLK2"

    Compress-Archive -Force C:/XSPLK2ClassFiles/* -DestinationPath $setupPath/$classId/Archives/C_XSPLK2ClassFiles.zip
    Compress-Archive -Force C:/Improving-your-Splunk-skills-master/* -DestinationPath $setupPath/$classId/Archives/C_Improving-your-Splunk-skills-master.zip

}