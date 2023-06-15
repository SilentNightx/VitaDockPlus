#!/bin/sh

# Enable boot messages.
sudo rm /boot/cmdline.txt
sudo cp /home/pi/Templates/Enable/cmdline.txt /boot/cmdline.txt
/home/pi/notify.sh "Boot messages enabled."