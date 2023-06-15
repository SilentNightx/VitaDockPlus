#!/bin/bash

# Set config to Plugin Controlled mode and restart MPV if running.
/home/pi/updateConfig.sh "DISPLAY_MODE" "pc"
/home/pi/notify.sh "Switched to Plugin Controlled mode."
sudo bash /home/pi/run.sh &
