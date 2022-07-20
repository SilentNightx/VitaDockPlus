# VitaDock Plus (+)
[![Discord](https://img.shields.io/discord/686957786327941157?logo=Discord&style=for-the-badge)](https://discord.gg/tQemjGd)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/SilentNightx/VitaDockPlus?style=for-the-badge)](https://github.com/SilentNightx/VitaDockPlus/releases)  
VitaDock+ is a Linux distribution for Raspberry Pi used to create a PlayStation Vita docking station for video output to a TV.

![Imgur Image](https://i.imgur.com/k2ZPx2m.png)

# Features
Hardware accelerated across all supported hardware  
Low input latency and accurate colors  
Lanczos upscaling to desired output resolution  
Display power control across all models  
Menu to switch between 960x544 @ 30FPS, 864x488 @ 60FPS, and Plugin Controlled modes  
VitaDock+ themed with fancy splash screen and notifications for visual feedback when changing settings  
Works on most Raspberry Pi models with a single image*  
Fits on 4GB SD cards  
Nintendo Switch RCM injection  
Cool experimental features (see below)  

*For older Raspberry Pi models there is a legacy image that may result in improved performance. 

# Tested Models
| Model | Status | Details |
| :-------------: | :-------------: | :-----: |
| Raspberry Pi 4 Model B Rev 1.1 (4GB) | Excellent |  |
| Raspberry Pi 4 Model B Rev 1.2 (2GB) | Excellent |  |
| Raspberry Pi 4 Model B Rev 1.1 (2GB) | Excellent |  |
| Raspberry Pi 3 Model B Plus Rev 1.3 |Excellent|  |
| Raspberry Pi 3 Model B Rev 1.2 |Excellent|  |
| Raspberry Pi 2 Model B Rev 1.1 | Good |  |
| Raspberry Pi Zero W Rev 1.1 | Works | Latency makes games unplayable on current image, use legacy image instead to make some games playable. Also see performance tips section below. |

To help me verify models please report to me how it is working for you and your exact model. You can get the exact model by opening a terminal with the run menu by running `x-terminal-emulator` then entering `cat /sys/firmware/devicetree/base/model`.  

# Requirements
1. A hacked Vita: https://vita.hacks.guide/  
2. Latest official vita-udcd-uvc installed on your Vita: https://github.com/xerpi/vita-udcd-uvc  
3. A Raspberry Pi with power cable, display cable, and 4GB+ SD/MicroSD card (see tested models above): <a target="_blank" href="https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=silentnightx-20&keywords=raspberry pi&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=5e8cae4be3a18d69a8eb02205751d14c">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />  
4. Computer with an SD card slot or a USB SD card reader (often included in Raspberry Pi starter kits)  
5. USB mouse to change settings or connect Bluetooth audio  

# Installation
1. Download the latest release of VitaDock+: https://github.com/SilentNightx/VitaDockPlus/releases/  
2. Download and install Raspberry Pi Imager for your operating system: https://www.raspberrypi.org/downloads/  
3. Plug in the SD card to your computer and run the Raspberry Pi Imager.  
4. When asked to choose OS select the option to use a custom image and select the VitaDock Plus VX.img you downloaded.  
5. Choose the SD card to write it to (make sure to select the right one).  
6. Click Write. Once it is done it will tell you to remove the SD card.  
7. Plug the SD card into your Pi and power it on. Depending on your Pi model it might take awhile to load as it automatically configures the image for you on first boot. If the Pi doesn't boot see the troubleshooting section below.
8. Once at the desktop it will prompt you to set your dock output resolution. This is the resolution your Pi will scale the Vita to. Your TV then upscales that to the resolution of your display if you don't have original size set in your display's input settings. Note that just because a Pi has 4K output doesn't mean it can handle it during video playback. For most scenarios I recommend you set this to 1280x720 @ 60Hz.  

Any time you see the VitaDock+ desktop you can plug your Vita in through USB to get video output.  

# Updating
Check back here for updates and rewrite the image when there is one. Data stored on the dock will be overwritten but this isn't really a distribution you're meant to store data on in the first place.  

# Recommended Plugins
MiniVitaTV by TheOfficialFloW: https://github.com/TheOfficialFloW/MiniVitaTV  
Allows the PS Vita to run like a PS TV, enabling DualShock 4 controllers to be connected and makes games load their PS TV control schemes.  

PSV-VSH-Menu by joel16: https://github.com/SilentNightx/PSV-VSH-Menu/releases/tag/3.50  
Allows you to set processor states for games, overlay FPS counter, and more. Checking the FPS of a game can be helpful when using VitaDock+ so you can decide what mode you want to use (HD @ 30 or SD @ 60).  

# Physical Power Button Feature
Connect a physical power button to Pin 5 (GPIO 3/SCL) and Pin 6 (GND).  

# Nintendo Switch RCM Injection Feature
Name your payload `payload.bin` and place in /boot/nx/. When the Pi detects a Switch in RCM mode over USB it will automatically inject the payload within 3 seconds.  

# Cases
https://www.thingiverse.com/thing:3942821   
https://www.thingiverse.com/thing:3502645  
https://www.thingiverse.com/thing:4609317  
https://www.tinkercad.com/things/b0GQwqVYNPP  


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

# Troubleshooting
Boot failure:  
1. Wait awhile. Some Pis can take up to 10 minutes to boot on the first boot.  
2. Try again by forcing the power off.  
3. Make sure you are using a good power supply.  
4. Try unplugging the HDMI cable and plugging it back in.
5. If your Pi has two HDMI ports try the other one.
6. Reimage the SD with the recommended imaging software.  
7. If you're running a newer model Pi it's possible it's a revision VitaDock+ doesn't support yet. Join our Discord server and let us know.  

Vita connection issues:  
1. Reboot the dock and the Vita and try again. Check the USB cable, it can make a difference.  
2. Make sure you have the latest official vita-udcd-uvc.  
3. Make sure your Pi has a good enough power supply.  
4. If you use a lot of plugins disable plugins you don't need to see if it increases your connection success rate.  
5. There is a correlation between long Vita boot time and vita-udcd-uvc connection success rate. If you have a lot of storage on your Vita it can take a long time to boot. If you are using StorageMgr for your storage consider switching to to yamt-vita or yamt-vita-lite to decrease boot times and increase connection success rate.  
6. If using an overclocking plugin on the Vita try setting it to 444 in the LiveArea to see if it helps connection issues.  

Screen flicker:  
1. Try setting your dock output resolution to the native resolution of your display.  
2. Try a different display. Some TVs have issues displaying Linux at any resolution other than native which is what I discovered on my TCL Roku living room TV.  

I have screen tearing:  
1. Sometimes this happens if you have the Vita plugged in when you boot the Pi. Simply unplug it and plug it back in.  

If all else fails join our Discord server and ask for help.  

# For Advanced Users
Username is `pi`
Password is `raspberry`
Do not connect VitaDock+ to the internet without changing this.

Use the run menu to access standard programs:  
`pcmanfm` to open file manager  
`x-terminal-emulator` to open terminal emulator  
`menulibre` to open menu editor  

If you want to install more programs first expand the filesystem with `raspi-config` to fill the rest of your SD card.

# Experimental Features
The features below are still in testing and may not work properly. Support will not be provided for them.

## Nintendo Switch Video Output With SysDVR
This feature allows you to connect a Switch that has SysDVR running in USB mode to get a video output. You must be in a game that supports SysDVR when you connect. Doesn't work on Pi 1 or Pi Zero 1. See https://github.com/exelix11/SysDVR for more information.

## Sharpscale Mode
This feature allows you to display native 720p from a Vita using the Sharpscale plugin. You'll need Sharpscale installed on your Vita along with a 1280×720 resolution patch plugin for a game and you need Unlock Framebuffer Size turned on in the Sharpscale config. See https://forum.devchroma.nl/index.php?topic=112.0 for more information.  

# Credits
Original VitaDock Team: Bu (m0tie), ZoidBerg, his wife Si (icon and video), David-OX, Crash, and myself.  
Special thanks to Xerpi (vita-udcd-uvc), TheOfficialFloW (various Vita exploits), Team Molecule (HENkaku), Relative (rpi-nx-rcm), and exelix11 (SysDVR).  
