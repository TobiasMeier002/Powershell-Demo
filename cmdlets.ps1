$PSVersionTable

get-help get-command

Get-Command | where-Object {$_.Source -eq "Hyper-V"} | Select-Object -First 1 | Select-Object -Property *