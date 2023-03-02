#!/bin/bash

# Displays a desktop notification

# Usage: /home/pi/notify.sh "Hello im a notification"

MESSAGE=$1

if [ -n "$MESSAGE"]
then
    notify-send -i /home/pi/Pictures/Icons/pspic.png "VitaDock Plus" "$MESSAGE"
fi