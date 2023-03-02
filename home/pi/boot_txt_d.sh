#!/bin/sh
sudo rm /boot/cmdline.txt
sudo cp /home/pi/Templates/Disable/cmdline.txt /boot/

/home/pi/notify.sh "Boot messages disabled."
