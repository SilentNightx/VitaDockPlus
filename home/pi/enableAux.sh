#!/bin/bash

AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)
/home/pi/notify.sh "Switching to AUX Input..."

/home/pi/updateConfig.sh "AUDIO_MODE" "AUX"

AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")
AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")

if [ "$AUX_SINK" == "" ] || [ "$AUX_SOURCE" == "" ]
then
    x-terminal-emulator -e /home/pi/configureAux.sh

    AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")
    AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")

fi

pactl unload-module module-loopback

pactl load-module module-loopback source="$AUX_SOURCE" sink="$AUX_SINK"