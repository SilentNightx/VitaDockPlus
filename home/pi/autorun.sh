#!/bin/bash

# Update udev rules, they tend to not trigger unless doing this on boot.
sudo udevadm trigger --action=change

# Allow on-screen popup notifications.
/usr/lib/notification-daemon/notification-daemon &

# Set Bluetooth or AUX audio
AUDIO_MODE=$(/home/pi/getConfig.sh AUDIO_MODE)

if [ "$AUDIO_MODE" == "BT" ]
then
    bluetoothctl power on
else
    AUX_SOURCE=$(/home/pi/getConfig.sh "AUX_SOURCE")
    AUX_SINK=$(/home/pi/getConfig.sh "AUX_SINK")

    pactl load-module module-loopback source="$AUX_SOURCE" sink="$AUX_SINK"
fi

# Run GPIO script for menu control in background.
nohup python /home/pi/gpioBTDiscovery.py &

# Registers a GPIO pin to act as a keyboard key
# The GPIO pin to use is read from config.
#
# Arguments:
# $1: Configuration key holding the GPIO pin number
# $2: The keycode which to trigger
register_GPIO_key() {
    local GPIO_CONFIG_KEY="$1"
    local KEYCODE="$2"

    local GPIO_KEY=$(/home/pi/getConfig.sh "$GPIO_CONFIG_KEY")

    if [ "$GPIO_KEY" != "" ]
    then
        sudo dtoverlay gpio-key gpio="$GPIO_KEY" keycode="$KEYCODE" label="$GPIO_KEY"
    fi
}

register_GPIO_key "LEFT_KEY_GPIO" "105"
register_GPIO_key "RIGHT_KEY_GPIO" "106"
register_GPIO_key "UP_KEY_GPIO" "103"
register_GPIO_key "DOWN_KEY_GPIO" "108"
register_GPIO_key "WINDOWS_KEY_GPIO" "125"
register_GPIO_key "ESCAPE_KEY_GPIO" "1"
register_GPIO_key "ENTER_KEY_GPIO" "28"
register_GPIO_key "TAB_KEY_GPIO" "15"

# Turn on the screensaver.
bash /home/pi/screensaveron.sh &

# Attempt to run a viewer in case Vita is already plugged in during boot and if not
# turn on the screensaver again since run.sh disables it before erroring out.
# Disabled for now because the viewer spawned at boot has screen tearing.
# bash /home/pi/run.sh || bash /home/pi/screensaveron.sh &