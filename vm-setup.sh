#!/bin/bash
# Initial Setup/Install
echo '-----------------'
echo 'Inital Setup/Install'
echo '-----------------'
cd
apt update -y
apt upgrade -y
apt install git -y
apt install wget -y
apt install curl -y
apt install vim -y
apt install gnupg gnupg2 gnupg1 -y

timedatectl set-timezone America/New_York

# Photon Setup
echo '-----------------'
echo 'Photon Setup/Clone'
echo '-----------------'
mkdir accelerate
cd accelerate
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon/tools
./ubuntu-node-install
cd ../cli
npm install
npm link
photon environment --setup --developer-setup --nginx-setup

cd


# Creating Helpful Docs 
echo '-----------------'
echo 'Adding Helpful Docs'
echo '-----------------'
echo 'Sample Commands for LXC/LXD

# Initizalize
lxd init

# Create Containers
lxc launch [OS_NAME] [CONTAINER_NAME]

# List Containers
lxc list

# Stop Containers
lxc stop [all|name]

# Login Containers
lxc exec [name] -- /bin/bash

# Run Commands Directly
lxc exec [name] -- apt-get update

# Pull/Push Files
lxc file pull|push first/etc/hosts .' > lxd-commands.txt

# # Setting up Gnome Desktop w/ gdm3
# echo '-----------------'
# echo 'Gnome Desktop Setup/Install'
# echo '-----------------'
# apt-get install gdm3 -y

# # Installing Terminator and Chrome
# echo '-----------------'
# echo 'Terminator & Chrome/Install'
# echo '-----------------'
# apt install terminator -y
# apt install chromium -y

# # Removing Unnecessary Apps & Files
# echo '-----------------'
# echo 'Gnome Contacts & Gimp/Uninstall'
# echo '-----------------'
# apt-get purge --auto-remove gnome-contacts -y
# apt-get purge --auto-remove gimp -y

# Snapd & LXD/LXC
echo '-----------------'
echo 'Snapd & LXD/Install'
echo '-----------------'
apt install snapd -y
snap install lxd 
echo "export PATH='$PATH:/snap/bin'" >> /root/.bashrc 

# All Done :)
echo '-----------------'
echo 'Build Complete'
echo '-----------------'

echo '-----------------'
echo 'RUN \lxd init/ to configure'
echo '-----------------'

reboot now
