Powershell

## INSTALLATION PROCESS ##

# Update the list packages
sudo apt update 

# Upgrade the list packages

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Pre-requisites in order to make xcfe works properly
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils

# XRDP for remote desktop access into the Linux system.
sudo apt install xrdp

# Install PowerShell
sudo snap install powershell --classic

# Start PowerShell
pwsh



## COMMANDS ##

# List default commands
Get-Command
Get-Command -verb "get"
Get-Command -Noun "date"
gcm

# To get help about a specific command
Get-Help <# parameter #>
Get-Help Get-Command
Get-Help Get-Command -Examples
Get-Help Get-Command -Detailed
Get-Help Get-Command -Full
Get-Help Get-Command -Online
Get-Command -?

# Alias
## As best practices, Alias should not be used in scripts
Get-Alias 
Get-Alias dir
Get-Alias -Definition "Get-ChildItem"

# Pipelines 
Get-ChildItem | Where-Object { $_.Length -gt 1kb } | Sort-Object Length

Get-ChildItem | 
    Where-Object { $_.Length -gt 1kb } | 
    Sort-Object Length | 
    Format-Table -Property Name, Length -AutoSize

Get-ChildItem | Select-Object Name, Length

$currentLocation = Get-Location

Get-ChildItem -Path $currentLocation `
              -File "*.ps1" `
              -Verbose | 
              Format-Table -Property Name, Length -AutoSize


# Providers - PowerShell providers are programs that provide access to specialized data stores for easier viewing and management.
# List default providers
Get-PSProvider

Get-ChildItem variable: | Format-Table -Property Name, Value -AutoSize
Get-ChildItem alias: | Format-Table -Property Name, Definition -AutoSize 


# Variables - All variables starts with $
$Var = "Hello World"
$Int = 11
$Int = 11 * 13
$Int++
$Var.GetType()
$Var.ToUpper()
$Var.ToLower()
$Var.Length

$Var | Get-Member

# To strongly type the variable, can't change the type
[System.Int32]$Var = 11
[int]$intVar = 13
[string]$stringVar = "Hello World"

# Compare
$Var.Contains("Hello")

$Int -gt 30 # Greater than
$Int -lt 30 # Less than
$Int -eq 30 # equals
$Int -ne 30 # not equal
$Int -le 30 # less than or equal to
$Int -ge 30 # greater than or equal to

$Var -in "hello world" # equal
$Var -notin "hello world" # not equa
$Var -Like "Hello" #  
$Var -NotLike "hello world" # 
$Var -Match "hello world" # based on regular expression
$Var -NotMatch "hello world" # based on regular expression

## Whatever is on the right is converted to the data type on the left
"42" -eq 42 # it converts the int to String and compare it
42 -eq "42" # it converts the String to int and compare it

## Common automatic variables
$pwd # current path
$HOME # User home directory
$Host # Info about a user scripting environment
$PID # Process ID 
$PSVersionTable # Info about the current version of Powershell

Get-ChildItem | Where-Object{ $_.Name -like "*.ps1"}

# Long version to declare a variable 
New-Variable -Name myNewVar -Value 11
Get-Variable myNewVar
Get-Variable myNewVar -ValueOnly
Get-Variable
Set-Variable -Name myNewVar -Value 13
Clear-Variable -Name myNewVar
$myNewVar -eq $null
Remove-Variable -Name myNewVar


## String interpolation
$items = (Get-ChildItem).Count
$loc = Get-Location
"There are $items items in the folder $loc"
"There are $((Get-ChildItem).count) in the folder $(Get-Location)"
$sql = @"
    select * from table where items = $items
"@


#
"PowerShell" -like "Power*" #true
"PowerShell" -like "abcdef" #false
"PowerShell" -like "?ower*" # ? works for a single character
"PowerShell" -like "Power*[s-v]" # regular expression to check if it ends with a letter between s-v
"PowerShell" -like "Power*[a-l]" # regular expression to check if it ends with a letter between a-l

# Regular expression
"999-888-7777" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}" # true
"ABC-888-7777" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}" # false

## Array
$array1 = "one","array"
$array1[0] = "power"
$array1[1] = "shell"

$array2 = @() # only way to create an array empty
$array2 += "teste"
$array2 += "prod"
$array2.Count

$array3 = 1..5
$array3.Count
$array3 -contains 4
$array3 -notcontains 6

## Hash tables
$hash = @{  "key" = "value";
            "name" = "nome";
            "surname" = "apelido"; }
$hash["key"]
$hash."name"

$mykey = "key"
$hash.$mykey
$hash.$("sur"+"name")

# add a new value
$hash["linux academy"] = "linuxacademy.com"
$hash

# remove a value
$hash.remove("surname") # pass a key as parameter

# verify if it contains something by passing the key
$hash.Contains("name")
$hash.Keys -contains "name"

# verify if it contains something by passing the value
$hash.ContainsValue("linuxacademy.com")
$hash.Values -contains "linuxacademy.com"


### Logic flow
# if elseif if
if($var -eq 1){

} elseif ($var -eq 2) {
    
}else{

}

# switch
switch($Var){
    1910{"dezenove dez"; break}
    1900{"dezenove zero zero"; break}
    default{"default"}
}

switch(1,3,2,4){
    1{"um"}
    2{"dois"}
    3{"três"}
    default{"qualquer valor"}
}

switch -CaseSensitive ("Renato"){
    "Renato"{"Ok"}
    "renato"{"NOK"}
    default{"no good"}
}

# For loop
foreach($file in Get-ChildItem){
    if($file.Name -like "*.ps1"){
        $file.Name
        break
    }
}


##
{ Clear-Host ; "Powershell"} # do not execute the command, just print it out
&{ Clear-Host ; "Powershell"} # execute the command 'clear-host'

$Var { Clear-Host ; "Powershell"}
& $Var { Clear-Host ; "Powershell"}


## Functions ##
# When creating a function, use an approved verb 
Get-Verb | Sort-Object Verb #approved verb

# In order to update the value of the variable inside the function, use [ref]
$name = "teste"
$lastname = "powershell"
function Get-Fullname($name,$lastname){
    return $name + $lastname
}

$returnValue = Get-Fullname -name "teste" -lastname "lastname"
$returnValue

## Pipeline functions ##
function Get-PSFiles(){
    # The begin block runs once ate the start of the function
    begin { $returnValue = "See the files: `n"}

    # The process block is executed once for each object 
    process{
        if($_.Name -like "*.ps1"){
            $returnValue += "`t$($_.Name)`n"
        }
    }

    # The end block runs once after the rest of the function
    end{
        return $returnValue
    }
}

Get-ChildItem | Get-PSFiles

## Advanced Functions ##

function Get-AValue(){
    [CmdletBinding()] # this indicates that it is a advanced function
    param( # Begin the parameter block
        [Parameter( Mandatory = $true,
                    HelpMessage = 'Please insert the value of One.')]
        [int] $one,
        [Parameter( Mandatory = $false,
                    HelpMessage = 'Please insert the value of Two.')]
        [int] $two = 10
    )

    begin {
    }

    process {
        return $one * $two
    }

    end {

    }
}

Get-AValue -one 10 -two 10
# Get-AValue -one 10 


## Try catch ##
function divver ($enum, $denom){
    Write-Host "Divver Begin"
    
    try{
        $result = $enum / $denom
        Write-Host "Result: $result"
    }
    catch{  
        Write-Host "An error occurred"
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        break
    }
    finally{
        Write-Host "Done!"
    }
}

divver 33 3
divver 33 0 # error