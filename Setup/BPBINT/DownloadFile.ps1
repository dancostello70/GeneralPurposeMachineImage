param (
    [string]$fileUrl =  $(throw "-fileUrl is required."), 
    [string]$destinationPath =  $(throw "-destinationPath is required.")
)

# Make a new webclient
$wc = New-Object System.Net.WebClient

# Get the setup menu
$wc.DownloadFile($fileUrl, $destinationPath)