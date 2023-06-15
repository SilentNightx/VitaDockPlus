# Switch to Dongle Bluetooth, enable Bluetooth if in AUX mode.
/home/pi/notify.sh "Switching to Dongle Bluetooth..."
/home/pi/updateConfig.sh "AUDIO_MODE" "BT"
pactl unload-module module-loopback
sudo mv ./blacklist-bluetooth.conf /etc/modprobe.d/ && reboot