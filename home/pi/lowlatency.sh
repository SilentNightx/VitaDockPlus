#!/bin/bash

MODEL="/sys/firmware/devicetree/base/model"

if grep -q "Raspberry Pi 4" "$MODEL"; then
	notify-send -i /home/pi/Pictures/Icons/pspic.png "VitaDock Plus" "This feature is not supported on your Pi model."
else
	sudo systemctl set-default multi-user.target
	sudo reboot now
fi