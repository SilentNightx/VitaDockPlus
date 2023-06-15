#!/bin/bash

# Disable GUI on supported Pis. Enable again using disablelowlatency.sh.
MODEL="/sys/firmware/devicetree/base/model"
if grep -q "Raspberry Pi 4" "$MODEL"; then
	/home/pi/notify.sh "This feature is not supported on your Pi model."
else
	sudo systemctl set-default multi-user.target
	sudo reboot now
fi