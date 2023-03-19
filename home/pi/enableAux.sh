#!/bin/bash

AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)
MESSAGE="Audio configured for Aux."

/home/pi/updateConfig.sh "AUDIO_MODE" "AUX"

bluetoothctl power off

AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")
AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")

if [ "$AUX_SINK" == "" ] || [ "$AUX_SOURCE" == "" ]
then
    lxterminal -e /home/pi/configureAux.sh

    AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")
    AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")

fi

pactl unload-module module-loopback

pactl load-module module-loopback source="$AUX_SOURCE" sink="$AUX_SINK"

/home/pi/notify.sh "$MESSAGE"
