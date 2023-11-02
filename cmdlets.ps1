$PSVersionTable

get-help get-command

(get-help get-command).gettype()

Get-Command | where-Object {$_.Source -eq "Hyper-V"} | Select-Object -First 1 | Select-Object -Property *

Invoke-RestMethod -Uri "https://api3.geo.admin.ch/rest/services/height?easting=2675427.0&northing=1221865.5" -Method Get