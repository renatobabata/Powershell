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
gcm

# To get help about a specific command
Get-Help <parameter>

pwd


