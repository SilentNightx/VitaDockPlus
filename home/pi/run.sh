#!/bin/bash

bash /home/pi/screensaveroff.sh &

MODEL="/sys/firmware/devicetree/base/model"

if grep -q "Raspberry Pi 4" "$MODEL"; then
	export DISPLAY=:0
	export XAUTHORITY=/home/pi/.Xauthority
fi

FILE="/home/pi/vitadock.conf"
if grep -q fps "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=864,height=488,pixelformat=nv12 -p 60
	ffmpeg -s:v copy -r:v copy -c:v h264_mmal -c:v h264_omx -pix_fmt:v nv12 -pre:v ultrafast -color_primaries smpte170m -color_trc smpte170m -colorspace smpte170m -color_range 2 -nostdin -f v4l2 /dev/video0 | ffplay -fs -autoexit -alwaysontop -fast -sws_flags lanczos -framerate 60 -fflags nobuffer -flags low_delay -framedrop -avioflags direct -fflags discardcorrupt -probesize 32 -analyzeduration 0 -sync ext /dev/video0
fi
if grep -q res "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=960,height=544,pixelformat=nv12 -p 30
	ffmpeg -s:v copy -r:v copy -c:v h264_mmal -c:v h264_omx -pix_fmt:v nv12 -pre:v ultrafast -color_primaries smpte170m -color_trc smpte170m -colorspace smpte170m -color_range 2 -nostdin -f v4l2 /dev/video0 | ffplay -fs -autoexit -alwaysontop -fast -sws_flags lanczos -framerate 30 -fflags nobuffer -flags low_delay -framedrop -avioflags direct -fflags discardcorrupt -probesize 32 -analyzeduration 0 -sync ext /dev/video0
fi
if grep -q sharp "$FILE"; then
	v4l2-ctl -d /dev/video0 -v width=1280,height=720,pixelformat=nv12 -p 30
	ffmpeg -s:v copy -r:v copy -c:v h264_mmal -c:v h264_omx -pix_fmt:v nv12 -pre:v ultrafast -color_primaries smpte170m -color_trc smpte170m -colorspace smpte170m -color_range 2 -nostdin -f v4l2 /dev/video0 | ffplay -fs -autoexit -alwaysontop -fast -framerate 30 -fflags nobuffer -flags low_delay -framedrop -avioflags direct -fflags discardcorrupt -probesize 32 -analyzeduration 0 -sync ext /dev/video0
fi
if grep -q pc "$FILE"; then
	v4l2-ctl -d /dev/video0 -v pixelformat=nv12
	ffmpeg -s:v copy -r:v copy -c:v h264_mmal -c:v h264_omx -pix_fmt:v nv12 -pre:v ultrafast -color_primaries smpte170m -color_trc smpte170m -colorspace smpte170m -color_range 2 -nostdin -f v4l2 /dev/video0 | ffplay -fs -autoexit -alwaysontop -fast -sws_flags lanczos -fflags nobuffer -flags low_delay -framedrop -avioflags direct -fflags discardcorrupt -probesize 32 -analyzeduration 0 -sync ext /dev/video0
fi
