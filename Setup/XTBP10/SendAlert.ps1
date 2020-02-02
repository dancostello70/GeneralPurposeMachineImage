$subject = "XTBP10 Setup Complete"
$message = ("Setup completed at {0} on {1}" -f $(Get-Date),$env:COMPUTERNAME)

$body = ConvertTo-Json @{
    "subject"=$subject
    "message"=$message 
    }


$header = @{
     "Accept"="application/json"
     "Content-Type"="application/json"
} 
    
Invoke-WebRequest -Headers $header -UseBasicParsing -Method POST -Uri "https://prod-39.eastus2.logic.azure.com:443/workflows/f3fef69adbe942eb92658b4569c4e44f/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=hfbFki1PBxtwOc60VUQy4F0MDyHXNvw-rllwvHXO4jE" -Body $body