#!/bin/bash
bash /home/pi/screensaveroff.sh &

export DISPLAY=:0
export XAUTHORITY=/home/pi/.Xauthority

dotnet ./SysDVR-Client/SysDVR-Client.dll usb --mpv /usr/bin/mpv &