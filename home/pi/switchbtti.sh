/home/pi/notify.sh "Switching to Internal Bluetooth..."

/home/pi/updateConfig.sh "AUDIO_MODE" "BT"

pactl unload-module module-loopback

sudo mv /etc/modprobe.d/blacklist-bluetooth.conf ./ && reboot