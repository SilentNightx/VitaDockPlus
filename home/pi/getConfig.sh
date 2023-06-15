#!/bin/bash

# Reads a configuration key value from vitadock.conf

# Usage: /home/pi/getConfig.sh <ConfigurationKey>

grep -E "^${1}=" -m 1 /home/pi/vitadock.conf | cut -d '=' -f 2
