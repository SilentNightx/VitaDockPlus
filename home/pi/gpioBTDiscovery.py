#!/usr/bin/python

import RPi.GPIO as gpio
from subprocess import call
from time import sleep
from configparser import ConfigParser
import sys

parser = ConfigParser()
with open('/home/pi/vitadock.conf') as stream:
    parser.read_string("[top]\n" + stream.read()) # There is no section in the config this adds a default root section

gpioPin = parser.get('top', 'DISCOVERY_KEY_GPIO')

if gpioPin == '' :
    sys.exit()

gpioPin = int(gpioPin)

gpio.setmode(gpio.BCM)
gpio.setup(gpioPin, gpio.IN, pull_up_down = gpio.PUD_UP)

def make_discoverable(channel):
    sleep(0.005) #handle debouncing issues
    if gpio.input(gpioPin) == 0:
        call('/home/pi/enableBTDiscovery.sh', shell=True)
    
gpio.add_event_detect(gpioPin, gpio.FALLING, callback=make_discoverable, bouncetime=300)

try:
    while True : pass
except:
    gpio.cleanup()
