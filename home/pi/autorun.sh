#!/bin/bash

sudo udevadm trigger --action=change
bash /home/pi/screensaveron.sh &
/usr/lib/notification-daemon/notification-daemon &
bash /home/pi/run.sh || bash /home/pi/screensaveron.sh &

AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)

if [ "$AUDIO_MODE" == "BT" ]
then
    bluetoothctl power on
else
    AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")
    AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")

    pactl load-module module-loopback source="$AUX_SOURCE" sink="$AUX_SINK"
fi
