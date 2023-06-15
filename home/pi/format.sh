#!/bin/bash 

# Clean some personal data, erase the swapfile, and reset the first boot
# message to prepare for imagaing.
/home/pi/notify.sh "Preparing VitaDock+ for imaging..."
sudo cp /home/pi/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
ifconfig wlan0 down
for device in $(bluetoothctl devices  | grep -o "[[:xdigit:]:]\{8,17\}"); do
    echo "removing bluetooth device: $device | $(bluetoothctl remove $device)"
done
sudo swapoff -a
sudo rm -r /var/swap
sudo trash-empty
trash-empty
sudo swapon -a
sudo rm -r /var/journal
sudo rm -r /home/pi/.bash_history
rm 1.txt
shutdown now
