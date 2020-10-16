#!/bin/bash
MODEL="/sys/firmware/devicetree/base/model"
CNFG="/boot/config.txt"

if grep -q "Raspberry Pi 4" "$MODEL"; then
	if grep -q -x "#dtoverlay=vc4-fkms-v3d" "$CNFG"; then
		sudo sed -i 's/#dtoverlay=vc4-fkms-v3d/dtoverlay=vc4-fkms-v3d/g' /boot/config.txt
		sudo reboot now
	fi
else
	if grep -q -x "dtoverlay=vc4-fkms-v3d" "$CNFG"; then
		sudo sed -i 's/dtoverlay=vc4-fkms-v3d/#dtoverlay=vc4-fkms-v3d/g' /boot/config.txt
		sudo reboot now
	fi
fi

sudo cp /home/pi/91-vita.rules /etc/udev/rules.d/
sudo cp /home/pi/92-dvita.rules /etc/udev/rules.d/
sudo udevadm trigger --action=change
sudo xrandr -d :0 -s 1280x720 -r 60.00
bash /home/pi/screensaveron.sh &