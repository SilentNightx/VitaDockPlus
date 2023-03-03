#!/bin/bash

sudo udevadm trigger --action=change
bash /home/pi/screensaveron.sh &
/usr/lib/notification-daemon/notification-daemon &
bash /home/pi/run.sh || bash /home/pi/screensaveron.sh &

AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)

if [ "$AUDIO_MODE" == "BT" ]
then
    bluetoothctl power on

    pactl unload-module module-loopback
else
    bluetoothctl power off

    pactl load-module module-loopback source=3 sink=0
fi
