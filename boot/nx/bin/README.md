# rpi-nx-rcm
Open source Raspberry Pi Nintendo Switch RCM dongle built around fusee-launcher

# Big Features
* Very open -- It runs on a Raspberry Pi, with all* of its internals on the /boot partition that is accessible when you insert the SD card into a Windows computer


\* - Service folder is on rootfs on the SD card, which is not accessible by a computer running Windows

# Installation
*note:* these instructions are based around a Raspberry Pi Zero v1.3 running Raspbian Stretch Lite
*important:* You must use Raspbian Stretch or Raspbian Stretch Lite, or some packages installed by the setup scripT
1. power the raspberry pi via the PWR IN microUSB OTG port
2. run `sudo bash -c "$(curl -fsSL https://gitlab.com/relatived/rpi-nx-rcm/raw/master/setup.sh)"` ON THE RASPBERRY PI
3. run `sudo shutdown NOW`
4. unplug the rpi
5. take out the microSD card
6. insert it into your computer
7. go to the boot partition then navigate to the nx folder in it
8. download a payload for RCM and move it to /nx/ folder and name it "payload.bin" (without quotes, obviously)
9. take out the microSD card (eject it first, incase you corrupt some shit), then insert it into the raspberry pi
Installation complete!

# Usage
1. power the raspberry pi via the PWR IN microUSB otg port (through usb battery or through a computer)
2. wait for either 1 minute, or for the light to turn solid green for ~30 seconds (whichever comes first)
3. turn off the Switch
4. insert your jig (or reboot if you corrupted boot0)
5. if you didn't install autorcm, turn your Switch on while holding the volume up button
6. if all goes well, the nintendo logo SHOULDN'T appear
7. in my case - plug in the microUSB to USB-B converter, plug a USB-A to USB-A cable into that, plug an USB-C to USB-B converter onto the end of the USB-A to USB-A cable
8. then plug that into the switch
9. it should have booted the payload!