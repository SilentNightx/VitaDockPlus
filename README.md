# VitaDock Plus (+)
VitaDock+ is the new and improved VitaDock software used to create a PlayStation Vita docking station for video output to a TV.
# Improvements over the original
Works on all Raspberry Pi models with a single image*.  
Uses FFmpeg+FFplay backend resulting in lower processor usage.  
Hardware accelerated across all supported hardware.  
Fits on 4GB SD cards.  
Built in option to switch between 960x544 @ 30 FPS and 864x488 @ 60 FPS.  
Lower input latency.  
More accurate colors.  
Lanczos upscaling.  
Fancy splash screen.  
Display power control*.  
Bug fixes.  

*Untested on most models as of now but it should just work. See info below to help me test and verify. 

# Removed from the original
FileZilla, Chromium, unused themes, and locales: They were taking up too much space. You can install them yourself if you wish.  
Boot video: It was cool but it also caused problems when booting with a Vita plugged in.  
Banner saying to plug in your Vita: It was just kind of unnecessary.  
Menu shortcuts to apps that let you use this as a Linux desktop: They made it too easy for people to break things.  

# Tested Models
| Model | Status | Details |
| :-------------: |:-------------:| :-----:|
| Raspberry Pi Zero W Rev 1.1|Excellent|Bluetooth might cause issues because of low processing power, consider overclocking.|
| Raspberry Pi 4 Model B Rev 1.1 (4GB)|Excellent|Display backlight might not go to sleep on timeout, a common issue with Pi 4 models.|

To help me verify models please report to me how it is working for you and your exact model. You can get the exact model by opening a terminal with the run menu by running `termit` then entering `cat /sys/firmware/devicetree/base/model`.

# Requirements
1. A hacked Vita: https://vita.hacks.guide/
2. vita-udcd-uvc installed on your Vita: https://github.com/xerpi/vita-udcd-uvc
3. A Raspberry Pi with power cable, display cable, and 4GB+ SD/MicroSD card (see tested models above): <a target="_blank" href="https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=silentnightx-20&keywords=raspberry pi&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=5e8cae4be3a18d69a8eb02205751d14c">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
4. Computer with an SD card slot or a USB SD card reader (often included in Raspberry Pi starter kits).

# Installation
1. Download the latest release of VitaDock+: https://github.com/SilentNightx/VitaDockPlus/releases/
2. Download and install Raspberry Pi Imager for your operating system: https://www.raspberrypi.org/downloads/
3. Plug in the SD card to your computer and run the Raspberry Pi Imager.
4. When asked to choose OS select the option to use a custom image and select the VitaDock Plus.img you downloaded.
5. Choose the SD card to write it to (make sure to select the right one).
6. Click Write. Once it is done it will tell you to remove the SD card.
7. Plug the SD card into your Pi and power it on.

Any time you see the VitaDock+ desktop you can plug your Vita in through USB to get video output.

# Updating
Check back here for updates and reburn the image when there is one. Data stored on the dock will be overwritten but this isn't really a distribution you're meant to store data on in the first place.

# Cases
https://www.thingiverse.com/thing:3942821  
https://www.thingiverse.com/thing:3502645  
https://www.tinkercad.com/things/b0GQwqVYNPP  

# Troubleshooting
Reboot the dock and the Vita and try again. Check the USB cable, it can make a difference.

# Upscaling
VitaDock+ upscales the Vita's 960x544 or 864x488 output to 720p with Lanczos filtering then your TV upscales that to the resolution of your panel using it's own method as long as you don't have original size set in your TV's input settings.

# For Advanced Users
Use the run menu to access standard programs:  
`pcmanfm` to open file manager  
`termit` to open terminal emulator  
`alacarte` to open menu editor  

# Experimental Sharpscale Mode
I've included a hidden experimental mode for users of the Sharpscale plugin: https://forum.devchroma.nl/index.php?topic=112.0

You'll need Sharpscale installed on your Vita along with a 1280×720 resolution patch plugin for a game and you need Unlock Framebuffer Size turned on in the Sharpscale config.
If installed correctly you will get a message about it when starting the game.

To enable support for Sharpscale video output to VitaDock+ open the run menu and run `alacarte`. You can then check the `Sharpscale @ 30FPS` option and press OK. In the VitaDock+ menu the option will now appear allowing you to switch to Sharpscale mode when clicking it. Sharpscale mode will only work in games you have a 1280×720 patch plugin for.

This is experimental and even though it should work I couldn't get it working in the few games I tested. Let me know if you try it with any success.

# Credits
Original VitaDock Team: Bu (m0tie), ZoidBerg, his wife Si (icon and video), David-OX, Crash, and myself.  
Special thanks to Xerpi (vita-udcd-uvc), TheOfficialFloW (various Vita exploits), and Team Molecule (HENkaku).  
