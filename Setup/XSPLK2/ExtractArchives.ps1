﻿$selectedClassId = "XSPLK2"
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"

$archiveList = Import-Csv "$classSetupRoot\ArchiveList.csv"

foreach($a in $archiveList){Expand-Archive -Force -Path ("{0}\Archives\{1}" -f $classSetupRoot,$a.Archive) -DestinationPath ("{0}/" -f $a.TargetPath)}