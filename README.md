# VitaDock Plus (+)
[![Discord](https://img.shields.io/discord/686957786327941157?logo=Discord&style=for-the-badge)](https://discord.gg/tQemjGd)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/SilentNightx/VitaDockPlus?style=for-the-badge)](https://github.com/SilentNightx/VitaDockPlus/releases)  
VitaDock+ is the new and improved VitaDock software used to create a PlayStation Vita docking station for video output to a TV.

# Improvements over the original
Works on most Raspberry Pi models with a single image*  
Uses FFmpeg+FFplay backend resulting in lower processor usage  
Hardware accelerated across all supported hardware  
Fits on 4GB SD cards  
Built in option to switch between 960x544 @ 30FPS, 864x488 @ 60FPS, and Plugin Controlled modes  
Lower input latency  
Low Latency Mode (disables Desktop for better performance)  
More accurate colors  
Lanczos upscaling  
Fancy splash screen  
Notifications for visual feedback when changing settings  
Display power control  
Bug fixes  

*Untested on most models as of now but it should just work. See info below to help me test and verify. 

# Removed from the original
FileZilla, Chromium, unused themes, and locales: They were taking up too much space. You can install them yourself if you wish.  
Boot video: It was cool but it also caused problems when booting with a Vita plugged in.  
Banner saying to plug in your Vita: It was just kind of unnecessary.  
Menu shortcuts to apps that let you use this as a Linux desktop: They made it too easy for people to break things.  

# Tested Models
| Model | Status | Details |
| :-------------: | :-------------: | :-----: |
| Raspberry Pi Zero W Rev 1.1 | Works | Latency will make certain games unplayable. Consider overclocking, disabling Bluetooth/WiFi, and using Low Latency Mode. |
| Raspberry Pi 2 Model B Rev 1.1 | Good |  |
| Raspberry Pi 3 Model B Rev 1.2 |Excellent|  |
| Raspberry Pi 3 Model B Plus Rev 1.3 |Excellent|  |
| Raspberry Pi 4 Model B Rev 1.1 (2GB) | Excellent | Display backlight might not go to sleep on timeout, a common issue with Pi 4 hardware. Low Latency Mode doesn't work but it's not really needed on Pi 4 anyway. |
| Raspberry Pi 4 Model B Rev 1.1 (4GB) | Excellent | Display backlight might not go to sleep on timeout, a common issue with Pi 4 hardware. Low Latency Mode doesn't work but it's not really needed on Pi 4 anyway. |

To help me verify models please report to me how it is working for you and your exact model. You can get the exact model by opening a terminal with the run menu by running `termit` then entering `cat /sys/firmware/devicetree/base/model`.  

# Requirements
1. A hacked Vita: https://vita.hacks.guide/  
2. Latest official vita-udcd-uvc installed on your Vita: https://github.com/xerpi/vita-udcd-uvc  
3. A Raspberry Pi with power cable, display cable, and 4GB+ SD/MicroSD card (see tested models above): <a target="_blank" href="https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=silentnightx-20&keywords=raspberry pi&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=5e8cae4be3a18d69a8eb02205751d14c">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />  
4. Computer with an SD card slot or a USB SD card reader (often included in Raspberry Pi starter kits).  

# Installation
1. Download the latest release of VitaDock+: https://github.com/SilentNightx/VitaDockPlus/releases/  
2. Download and install Raspberry Pi Imager for your operating system: https://www.raspberrypi.org/downloads/  
3. Plug in the SD card to your computer and run the Raspberry Pi Imager.  
4. When asked to choose OS select the option to use a custom image and select the VitaDock Plus VX.img you downloaded.  
5. Choose the SD card to write it to (make sure to select the right one).  
6. Click Write. Once it is done it will tell you to remove the SD card.  
7. Plug the SD card into your Pi and power it on. Depending on your Pi model it might reboot once to automatically configure the image for your model.  

Any time you see the VitaDock+ desktop you can plug your Vita in through USB to get video output.  

# Recommended Plugins
MiniVitaTV by TheOfficialFloW: https://github.com/TheOfficialFloW/MiniVitaTV  
Allows the PS Vita to run like a PS TV, enabling DualShock 4 controllers to be connected and makes games load their PS TV control schemes.  

PSV-VSH-Menu by joel16: https://github.com/SilentNightx/PSV-VSH-Menu/releases/tag/3.50  
Allows you to set processor states for games, overlay FPS counter, and more. Checking the FPS of a game can be helpful when using VitaDock+ so you can decide what mode you want to use (HD @ 30 or SD @ 60).  

# Performance Tips
Overclocking and disabling Bluetooth on low powered Pis can help. Good starting overclock values:  

| Model | arm_freq | core_freq | gpu_freq | sdram_freq | over_voltage | Cooling Required |
| :-------------: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| Raspberry Pi 1 Model A & B	| 1000 | 450 |  |  | 6 |  |
| Raspberry Pi A+ / B+ / Compute Module | 1100 | 450 |  | 450 | 6 | Yes |
| Raspberry Pi Zero / Zero W	| 1100 | 450 |  |  | 6 |  |
| Raspberry Pi 2 v1.1	| 1000 | 500 |  |  | 2 |  |
| Raspberry Pi 2 V1.2 | 1300 | 500 |  |  | 4 |  |
| Raspberry Pi 3 & Compute Module 3	| 1300 | 500 |  |  | 4 |  |
| Raspberry Pi 3 A+ / B+ / Compute Module 3+	| 1500 |  |  |  | 4 |  |
| Raspberry Pi 4	| 2100 |  | 750 |  | 6 |  |

Data from: https://www.tomshardware.com/how-to/overclock-any-raspberry-pi  
I do not take responsibility for anyone damaging their hardware with overclocking.  

# Updating
Check back here for updates and rewrite the image when there is one. Data stored on the dock will be overwritten but this isn't really a distribution you're meant to store data on in the first place.  

# Cases
https://www.thingiverse.com/thing:3942821  
https://www.thingiverse.com/thing:4460743  
https://www.thingiverse.com/thing:3502645  
https://www.thingiverse.com/thing:4609317  
https://www.tinkercad.com/things/b0GQwqVYNPP  

# Connection Troubleshooting
Some Vitas have trouble connecting to the Pi for unknown reasons. The following steps can help mitigate the issue:  
1. Reboot the dock and the Vita and try again. Check the USB cable, it can make a difference.  
2. Make sure you have the latest official vita-udcd-uvc.  
3. Make sure your Pi has a good enough power supply.  
4. If you use a lot of plugins disable plugins you don't need to see if it increases your connection success rate.  
5. There is a correlation between long Vita boot time and vita-udcd-uvc connection success rate. If you have a lot of storage on your Vita it can take a long time to boot. If you are using StorageMgr for your storage consider switching to to yamt-vita or yamt-vita-lite to decrease boot times and increase connection success rate.  
6. If using an overclocking plugin on the Vita try setting it to 444 in the LiveArea to see if it helps connection issues.  

# Upscaling
VitaDock+ upscales the Vita's 960x544 or 864x488 output to 720p with Lanczos filtering then your TV upscales that to the resolution of your panel using it's own method as long as you don't have original size set in your TV's input settings.  

# For Advanced Users
Use the run menu to access standard programs:  
`pcmanfm` to open file manager  
`termit` to open terminal emulator  
`alacarte` to open menu editor*  
*SOMETIMES ALACARTE MENU EDITOR RESETS THE ENTIRE MAIN MENU JUST FROM OPENING IT AND I HAVE NO IDEA WHY, OPEN AT YOUR OWN RISK!  

If you want to install more programs first expand the filesystem with raspi-config to fill the rest of your SD card. Sometimes installing programs will fail due to low memory, this is because the swapfile is disabled by default to keep performance consistent across Pi models and allow the image to fit on 4GB SD cards. Please edit /etc/dphys-swapfile then reboot to give your Pi more memory to work with.  

# Add-on Features
Add-on features aren't installed by default due to them using some CPU cycles in the background which may hurt performance on low end Pis. To install add-on features you need to do the following first:  
1. Connect to the internet.  
2. Go to the run menu and open `termit` then type `sudo raspi-config` and press enter. Navigate to Advanced Options > Expand Filesystem to expand the filesystem on next reboot allowing free SD card space to be used. Reboot.  
When you are done installing Add-on Features disable WiFi to save processing power and prevent interference.  

## pi-power-button by Howchoo  
This add-on feature allows you to use a physical power button with Pin 5 (GPIO 3/SCL) and Pin 6 (GND).  
1. Run `termit` then type `git clone https://github.com/Howchoo/pi-power-button.git` and press enter  
2. Type `./pi-power-button/script/install` and press enter.  
3. Reboot  
To uninstall type `./pi-power-button/script/uninstall` and press enter.  

## rpi-nx-rcm by Relative  
This add-on feature is for owners of hacked Nintendo Switches. Install it to enable your Pi to automatically inject a payload to your Switch over USB when a Switch in RCM mode is detected by the Pi. I've patched this script to not use 100% of the CPU but sometimes it still does and I'm unsure why. If you get an overheating icon while playing games or playback isn't as good as expected then reboot your Pi to reset the script.  
1. Run `termit` then type `sudo bash -c "$(curl -fsSL https://gitlab.com/SilentNightx/rpi-nx-rcm/raw/master/setup.sh)"` and press enter  
2. Shutdown  
3. Insert the Pi SD card into a desktop computer  
4. Place your payload in /boot/nx/ and rename it to `payload.bin`  
5. Eject the SD card and put it back in your Pi and boot it up  
6. When the Pi detects a Switch in RCM mode over USB it will automatically inject the payload you put in /boot/nx/ within 3 seconds  
There is no uninstall so it might be easier to reburn the image if you decide you don't want it.  

# Experimental Sharpscale Mode
I've included a hidden experimental mode for users of the Sharpscale plugin: https://forum.devchroma.nl/index.php?topic=112.0  

You'll need Sharpscale installed on your Vita along with a 1280×720 resolution patch plugin for a game and you need Unlock Framebuffer Size turned on in the Sharpscale config.
If installed correctly you will get a message about it when starting the game.  

To enable support for Sharpscale video output to VitaDock+ open the run menu and run `alacarte`. You can then check the `Sharpscale @ 30FPS` option and press OK. In the VitaDock+ menu the option will now appear allowing you to switch to Sharpscale mode when clicking it. Sharpscale mode will only work in games you have a 1280×720 patch plugin for.  

This is experimental and even though it should work I couldn't get it working in the few games I tested. Let me know if you try it with any success.  

# Credits
Original VitaDock Team: Bu (m0tie), ZoidBerg, his wife Si (icon and video), David-OX, Crash, and myself.  
Special thanks to Xerpi (vita-udcd-uvc), TheOfficialFloW (various Vita exploits), and Team Molecule (HENkaku).  
