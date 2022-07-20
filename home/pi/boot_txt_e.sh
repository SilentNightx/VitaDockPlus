#!/bin/sh
sudo rm /boot/cmdline.txt
sudo cp /home/pi/Templates/Enable/cmdline.txt /boot/cmdline.txt
notify-send -i /home/pi/Pictures/Icons/pspic.png "VitaDock Plus" "Boot messages enabled."
