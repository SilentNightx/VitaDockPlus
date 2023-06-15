#!/bin/bash

# Enable Bluetooth Discovery
#
# Makes the VitaDock+ discoverable by the PSVita
#
# Checks if the Bluetooth Service is running first to prevent bluetoothctl commands hanging
# Default timeout of 3 minuets applies after which discovery will be disabled

BT_RUNNING=$(sudo service bluetooth status | grep -o "Running" | xargs)

if [ "$BT_RUNNING" == "Running" ]
then
	bluetoothctl discoverable on

	/home/pi/notify.sh "Bluetooth discovery has been enabled for three minuets."
else
	/home/pi/notify.sh "Bluetooth is not running, please connect a Bluetooth dongle."
fi