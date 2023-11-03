$IPAddress = '192.168.101.190'

$Session = New-PSSession -SSHTransport -HostName $IPAddress -UserName dev

Get-PSSession

Invoke-Command -Session $Session -ScriptBlock {[System.Environment]::OSVersion.Version}

Invoke-Command -Session $Session -ScriptBlock {lsb_release -a}

Invoke-Command -Session $Session -ScriptBlock {get-Process | Select-Object -First 5}

Enter-PSSession -Session $Session

Exit-PSSession