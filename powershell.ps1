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