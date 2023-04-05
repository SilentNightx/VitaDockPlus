#!/bin/bash

# Aux Configuration Tool
#
# Provides a simple way to select the input (Source) and output (Sink) devices
# to be used by the Loop Back Module.
#
# Parses the output from `pactl list short sources` and `pactl list short sinks`
# To populate menu items. Selected items are then saved within the vitadock.conf
#
# If Aux is enabled when run the Loopback Module will be reloaded with the newly
# selected devices

WELCOME_DESC="This tool is used to configure capturing the PSVita's audio via Aux input.\n\nUse the arrow keys to highlight options and the tab key to highlight actions.\nUse the enter key to select the highlighted element."
whiptail --title "Aux Configuration Tool" --msgbox "$WELCOME_DESC" 20 80 

INTRO_DESC="The Rasperry Pi 3 and 4 do NOT have a line in (Aux) device."
INTRO_DESC+="\nA USB line in device will be needed.\nPlease see the Aux Audio section of the https://github.com/SilentNightx/VitaDockPlus ReadMe file."
INTRO_DESC+="\n\nEnsure your USB line device is connected before continuing"

whiptail --title "Aux Configuration Tool" --msgbox "$INTRO_DESC" 20 80 

INDX=0
SRC_OPTIONS=()
SNK_OPTIONS=()
SOURCES=$(pactl list short sources)
SINKS=$(pactl list short sinks)

while read line
do
	SRC_OPTIONS[INDX]=$(echo "$line" | cut -f 1)
	INDX+=1
	SRC_OPTIONS[INDX]=$(echo "$line" | cut -f 2)
	INDX+=1
done <<<  "$SOURCES"

SRC_TITLE="Select Input Device"
SRC_DESC="Select the device used to capture the PSVita's audio.\nThis is your USB line in device"

SELECTED_SRC=$(whiptail --title "$SRC_TITLE" --menu "$SRC_DESC" 20 80 10 ${SRC_OPTIONS[@]} 3>&1 1>&2 2>&3)

INDX=0

while read line
do
	SNK_OPTIONS[INDX]=$(echo "$line" | cut -f 1)
	INDX+=1
	SNK_OPTIONS[INDX]=$(echo "$line" | cut -f 2)
	INDX+=1
done <<< "$SINKS"

SNK_TITLE="Select Output Device"
SNK_DESC="Select the device used to play the PSVita's audio. Most likely HDMI."

SELECTED_SNK=$(whiptail --title "$SNK_TITLE" --menu "$SNK_DESC" 20 80 10 ${SNK_OPTIONS[@]} 3>&1 1>&2 2>&3)

AUDIO_MODE=$(/home/pi/getConfig.sh "AUDIO_MODE")

if [ "$AUDIO_MODE" == "AUX" ]
then
	pactl unload-module module-loopback
	pactl load-module module-loopback source="$SELECTED_SRC" sink="$SELECTED_SNK"
fi

/home/pi/updateConfig.sh "AUX_SOURCE" "$SELECTED_SRC"

/home/pi/updateConfig.sh "AUX_SINK" "$SELECTED_SNK"
 
