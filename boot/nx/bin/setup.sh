#!/bin/bash
echo "Setting up Raspberry Pi for Nintendo Switch Tegra RCM exploiting"
sudo apt-get update
sudo apt-get install -y daemontools daemontools-run python3-pip git

# Directories to be made #####
echo "Creating directories..."
sudo mkdir /boot/nx
sudo mkdir /boot/nx/bin
sudo mkdir /boot/nx/fusee

sudo mkdir /etc/service/nxrcm
##############################

# Populate directories #######
echo "Populating directories..."
echo "Cloning reswitched/fusee-launcher"
echo "Fusée Launcher is licensed under the GNU GPLv2 license."
sudo git clone https://github.com/reswitched/fusee-launcher.git /boot/nx/fusee

echo "Cloning rpi-nx-rcm source"
echo "The rpi-nx-rcm source code is licensed under the GNU GPLv2 license."
sudo git clone -b master git@gitlab.com:relatived/rpi-nx-rcm.git /boot/nx/bin

sudo cp /boot/nx/bin/service_run.sh /etc/service/nxrcm/run
cd /etc/service
sudo svc -d nxrcm
sudo chmod u+x /etc/service/nxrcm/run
##############################

# Miscellaneous Tweaks #######
echo "Tweaking..."
cd /boot/nx/fusee
sudo git checkout 433077ab727e41052bdd17693648a71087d8ac29 # checkout commit 433077a from fusee-launcher repo (patch should only work on that commit)
sudo git reset --hard
sudo git -c user.email="relatived@protonmail.com" -c user.name="Relative" am /boot/nx/bin/fusee.patch
sudo pip3 install -r requirements.txt

cd /boot/nx/bin
sudo pip3 install -r requirements.txt
##############################

cd ~

echo "Complete!"
echo "Please read the post-installation instructions."
