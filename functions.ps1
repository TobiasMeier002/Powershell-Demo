function new-DemoDir {
    # Define String Variable implicit
    $RootPath = "$($ENV:USERPROFILE)\AppData\Local\POWERSHELL-DEMO"
    if (-not (Test-Path -Path $RootPath)) {
        New-Item -Path $RootPath -ItemType Directory
    }
    #Change Working Dir to Root Path
    Set-Location $RootPath
    for ($i = 0; $i -lt 10; $i++) {
        New-Item -Path .\$i -ItemType Directory
        for ($j = 0; $j -lt 10; $j++) {
            New-Item -Path ".\$i\$(-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})).txt" -ItemType File -Value  $(-join ((65..90) + (97..122) | Get-Random -Count 512 | % {[char]$_}))
        }
    }
}
function remove-DemoDir {
    $RootPath = "$($ENV:USERPROFILE)\AppData\Local\POWERSHELL-DEMO"
    if ((get-Location).Path -eq $RootPath) {
        Set-Location 
    }
    Remove-Item -Path $RootPath -Recurse -Force
}
function new-Backup {
    [CmdletBinding()]
    param (
        # Source Path
        [Parameter(Mandatory=$true,ValueFromPipeline)]
        [string]
        $Source,
        # Destination Path
        [Parameter(Mandatory=$true)]
        [string]
        $Destination,
        # Recurse
        [Parameter()]
        [switch]
        $Recurse,
        # Differencial
        [Parameter()]
        [switch]
        $Differencial
    )
    
    begin {

    }
    
    process {
        if ($Recurse) {
            $Items = Get-ChildItem -Path $Source -Recurse
        }else {
            $Items = Get-ChildItem -Path $Source
        }
        if ($Differencial) {
            $Items = $Items | Where-Object {$_.Attributes -contains 'Archive'}
        }        
        
        foreach ($Item in $Items) {
            Copy-Item -Path $Item.FullName -Destination $Item.FullName.Replace($Source,$Destination) -Force
            $Item.attributes = $Item.Attributes -bxor ([System.IO.FileAttributes]::Archive)
            Write-Host "$Item copied"
        } 
    }
    
    end {
        return "Backup Successfull"
    }
}

remove-DemoDir

new-DemoDir

$RootPath = "$($ENV:USERPROFILE)\AppData\Local\POWERSHELL-DEMO"

new-Backup -Source $RootPath -Destination "$ENV:TEMP\Backup" -Recurse -Differencial