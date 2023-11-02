Install-Module -Name Az

Get-Help Connect-AzAccount
Get-Help Get-AzADUser -Examples

Connect-AzAccount
Measure-Command{
    $Users = Get-AzADUser
}

$Me = $Users | where-Object {$_.Mail -eq 'tobias.meier@stud.hslu.ch'}
$Me | Select-Object *

Get-AzADGroup | Select-Object -First 20



Import-Module .\DemoModule\ -Force