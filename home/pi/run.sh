#!/bin/bash

# Terminate MPV if already running.
sudo pkill -15 mpv
sudo pkill -9 mpv

# Disable screensaver.
bash /home/pi/screensaveroff.sh &

# Some Pis don't run the viewer if these aren't set.
export DISPLAY=:0
export XAUTHORITY=/home/pi/.Xauthority

# Set UVC mode based on config.
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

# Launch video player with settings that depend on color range config.
VIDEO_OUTPUT_LEVEL=$(/home/pi/getConfig.sh VIDEO_OUTPUT_LEVEL)
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --no-audio --opengl-glfinish=yes --opengl-swapinterval=0 --no-cache --really-quiet --fs --force-window=immediate --title=VitaDock+ --no-border --sws-scaler=lanczos --sws-fast=yes --scale=ewa_lanczossharp --video-output-levels="$VIDEO_OUTPUT_LEVEL" --osc=no || exit

