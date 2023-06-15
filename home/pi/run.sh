#!/bin/bash

sudo pkill -15 mpv
sudo pkill -9 mpv

bash /home/pi/screensaveroff.sh &

export DISPLAY=:0
export XAUTHORITY=/home/pi/.Xauthority

DISPLAY_MODE=$(/home/pi/getConfig.sh DISPLAY_MODE)

case $DISPLAY_MODE in
	fps)
		v4l2-ctl -d /dev/video0 -v width=864,height=488,pixelformat=NV12 -p 60
	;;

	res)
		v4l2-ctl -d /dev/video0 -v width=960,height=544,pixelformat=NV12 -p 30
	;;

	pc)
		v4l2-ctl -d /dev/video0 -v pixelformat=NV12
	;;

	sharp)
		v4l2-ctl -d /dev/video0 -v width=1280,height=720,pixelformat=NV12 -p 30
	;;
esac

VIDEO_OUTPUT_LEVEL=$(/home/pi/getConfig.sh VIDEO_OUTPUT_LEVEL)

mpv av://v4l2:/dev/video0 --video-output-levels="$VIDEO_OUTPUT_LEVEL" --profile=low-latency --untimed --no-audio --opengl-glfinish=yes --opengl-swapinterval=0 --no-cache --really-quiet --fs --ontop --force-window=immediate --title=VitaDock+ --no-border --sws-scaler=lanczos --sws-fast=yes --scale=ewa_lanczossharp || exit
