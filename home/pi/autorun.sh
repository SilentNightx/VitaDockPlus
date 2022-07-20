#!/bin/bash

sudo udevadm trigger --action=change
bash /home/pi/screensaveron.sh &
/usr/lib/notification-daemon/notification-daemon &
bluetoothctl power on &
bash /home/pi/run.sh || bash /home/pi/screensaveron.sh &
