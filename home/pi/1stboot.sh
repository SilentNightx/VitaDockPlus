#!/bin/bash
file="./1.txt"
if [ ! -f "$file" ]
then	
    
    sudo piwiz &
    sleep 5
    zenity --text-info --title="Please read" --filename=./intro.txt --width=600 --height=500 &
    touch ./1.txt 

else
    end
fi