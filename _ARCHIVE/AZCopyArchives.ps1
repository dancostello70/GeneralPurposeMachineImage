
cd C:\Utility

$env:AZCOPY_CRED_TYPE = "Anonymous";

# XRPINP
# ./azcopy.exe copy "D:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\DeploymentPackages\XRPINP.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/XRPINP.zip?sv=2019-12-12&se=2021-03-14T01%3A57%3A11Z&sr=c&sp=rwl&sig=C%2B2FxB32w6xRsxoNdV%2Bug17NKdqCG%2BJSGwuvvXjFOeI%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

# CS_DP200 (CareSource custom)
./azcopy.exe copy "D:\DC\Clients\ONLC\Projects\CustomTraining\20200210BrooksourceDP200\AzureDataClassFiles.zip" "https://onlcsetup.blob.core.windows.net/setupfiles/AzureDataClassFiles.zip?sv=2019-12-12&se=2021-03-14T01%3A57%3A11Z&sr=c&sp=rwl&sig=C%2B2FxB32w6xRsxoNdV%2Bug17NKdqCG%2BJSGwuvvXjFOeI%3D" --overwrite=true --from-to=LocalBlob --blob-type Detect --follow-symlinks --put-md5 --follow-symlinks --recursive;

$env:AZCOPY_CRED_TYPE = "";

