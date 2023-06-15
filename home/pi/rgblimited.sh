#!/bin/bash

# Set to limited color range and restart MPV if running.
/home/pi/updateConfig.sh "VIDEO_OUTPUT_LEVEL" "limited"
/home/pi/notify.sh "Switched to RGB limited range."
sudo bash /home/pi/run.sh &