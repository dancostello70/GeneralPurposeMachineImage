

# XRPINP

$env:AZCOPY_CRED_TYPE = "Anonymous";
./azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\XRPINP.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XRPINP.zip?sv=2019-10-10&se=2020-10-13T22%3A05%3A56Z&sr=c&sp=rwl&sig=KlRqMFDGuE6yGNPFI8qkzWLBp140MyYF11nrOQ%2FPWMg%3D" --overwrite=prompt --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;
$env:AZCOPY_CRED_TYPE = "";


