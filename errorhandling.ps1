$ErrorActionPreference

$ErrorActionPreference = 'Continue'

Get-ChildItem -Path C:\NonexistingPath
Write-Host "This is a non terminating Error, script is still running"

$ErrorActionPreference = 'Stop'

Get-ChildItem -Path C:\NonexistingPath
Write-Host "Error Action Preference is set Stop, script will be terminated before this line is executed"

$ErrorActionPreference = 'Continue'

try {
    Get-ChildItem -Path C:\NonexistingPath
    Write-Host "This is a non terminating Error, script is still running"
}
catch {
    Write-Host "This Line will not be executed, because of the non Terminating Error"
}

$ErrorActionPreference = 'Stop'

try {
    Get-ChildItem -Path C:\NonexistingPath
    Write-Host "Error Action Preference is set Stop, script will be terminated before this line is executed"
}
catch {
    Write-Host "This Line will be executed, because of the ErrorAction Preference"
}