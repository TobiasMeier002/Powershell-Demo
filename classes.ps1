class Address {
    [string] $Street
    [string] $City
    [int] $ZipCode
    [string] $Country
}


class Person {
    [string] $Name
    [string] $Email
    [string] $Phone
    [Address] $Address
}

class Professor : Person {
    [string] $Salary
}

class Student : Person {
    [string] $Modul
    [int] $MatriculationNumber
    [float] $Grade

    Student([string]$Name,[string]$Email) {
        $this.Name = $Name
        $this.Email = $Email
        $this.Address = [Address]::new()
    }

    [string] registerModul ([string]$ModulName){
        return "$($This.Name) has successfully registered for module $ModulName"
    }
}

$Student1 = [Student]::new("Tobias Meier","tobias.meier@stud.hslu.ch")

$Student1.GetType()

$Student1.registerModul("CAS MSED")


[System.Math]::Min(2,7)

[System.Math]::Max(2,7)