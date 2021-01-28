# Extract archives for XALINS (Alteryx Concepts - Level 1)
param($ClassId)

$selectedClassId = $ClassId
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"

$archiveList = Import-Csv "$classSetupRoot\ArchiveList.csv"

foreach($a in $archiveList){Expand-Archive -Force -Path ("{0}\Archives\{1}" -f $classSetupRoot,$a.Archive) -DestinationPath ("{0}/" -f $a.TargetPath)}