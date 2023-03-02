#!/bin/bash

# Sets a configuration key from vitadock.conf
# It does not add a new key should it not already exist

# Usage: /home/pi/updateConfig.sh <ConfigurationKey> <Value>

CFGKEY=$1
CFGVAL=$2

if [ -z "$CFGKEY" ]
then
    echo "Missing configuration key argument"
    exit
fi

if [ -z "$CFGVAL" ]
then
    echo "Missing configuration value"
    exit
fi

sed -i "s/$CFGKEY=.*/$CFGKEY=$CFGVAL/" "/home/pi/vitadock.conf"
