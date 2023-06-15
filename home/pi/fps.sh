#!/bin/bash

# Set config to FPS priority and restart MPV if running.
/home/pi/updateConfig.sh "DISPLAY_MODE" "fps"
/home/pi/notify.sh "Switched to SD @ 60FPS."
sudo bash /home/pi/run.sh &