# Extract archives for BDXM01 (DAX Formulas for Dynamic Tables)
param($ClassId)

$selectedClassId = $ClassId
$classSetupRoot = "$env:SETUPROOT\$selectedClassId"

$archiveList = Import-Csv "$classSetupRoot\ArchiveList.csv"

foreach($a in $archiveList){Expand-Archive -Force -Path ("{0}\Archives\{1}" -f $classSetupRoot,$a.Archive) -DestinationPath ("{0}/" -f $a.TargetPath)}