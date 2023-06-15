#!/bin/bash
echo "Removing rpi-nx-rcm source code and tweaks made by the setup script..."

# Stop service ###############
cd /etc/service
sudo svc -d nxrcm
##############################

# Directories to be removed ##
sudo rm -r /boot/nx/fusee
sudo rm -r /boot/nx/bin
sudo rm -r /boot/nx

sudo rm -r /etc/service/nxrcm
##############################

cd ~

echo "Complete!"