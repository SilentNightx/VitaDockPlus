#!/bin/sh
sudo rm /boot/cmdline.txt
sudo cp /home/pi/Templates/Disable/cmdline.txt /boot/
notify-send -i /home/pi/Pictures/Icons/pspic.png "VitaDock Plus" "Boot messages disabled."
