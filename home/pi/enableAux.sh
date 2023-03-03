#!/bin/bash

AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)
MESSAGE="Audio configured for Aux."

if [ "$AUDIO_MODE" == "AUX" ]
then
    MESSAGE="Aux audio already enabled."
else
    /home/pi/updateConfig.sh "AUDIO_MODE" "AUX"

    bluetoothctl power off

    pactl load-module module-loopback source=3 sink=0

    MESSAGE="Audio configured for Aux"
fi

/home/pi/notify.sh "$MESSAGE"
