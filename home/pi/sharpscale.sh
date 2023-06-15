#!/bin/bash

# Set config to Sharpscale mode and restart MPV if running.
/home/pi/updateConfig.sh "DISPLAY_MODE" "sharp"
/home/pi/notify.sh "Switched to Sharpscale mode."
sudo bash /home/pi/run.sh &