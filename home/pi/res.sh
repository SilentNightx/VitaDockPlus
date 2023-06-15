#!/bin/bash

# Set config to resolution priority and restart MPV if running.
/home/pi/updateConfig.sh "DISPLAY_MODE" "res"
/home/pi/notify.sh "Switched to HD @ 30FPS."
sudo bash /home/pi/run.sh &