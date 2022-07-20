#!/bin/bash

sudo pkill -15 mpv
sudo pkill -9 mpv

bash /home/pi/screensaveroff.sh &

export DISPLAY=:0
export XAUTHORITY=/home/pi/.Xauthority

FILE="/home/pi/vitadock.conf"
if grep -q fps "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=864,height=488,pixelformat=NV12 -p 60
fi
if grep -q res "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=960,height=544,pixelformat=NV12 -p 30
fi
if grep -q pc "$FILE"; then
	v4l2-ctl -d /dev/video0 -v pixelformat=NV12
fi
if grep -q sharp "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=1280,height=720,pixelformat=NV12 -p 30
fi

mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --no-audio --opengl-glfinish=yes --opengl-swapinterval=0 --no-cache --really-quiet --fs --ontop --force-window=immediate --title=VitaDock+ --no-border --sws-scaler=lanczos --sws-fast=yes --scale=ewa_lanczossharp || exit
