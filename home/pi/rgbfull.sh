#!/bin/bash

# Set to full color range and restart MPV if running.
/home/pi/updateConfig.sh "VIDEO_OUTPUT_LEVEL" "full"
/home/pi/notify.sh "Switched to RGB full range."
sudo bash /home/pi/run.sh &
