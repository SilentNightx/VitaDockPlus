# VitaDock Plus (+)

[![Discord](https://img.shields.io/discord/686957786327941157?logo=Discord&style=for-the-badge)](https://discord.gg/tQemjGd)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/SilentNightx/VitaDockPlus?style=for-the-badge)](https://github.com/SilentNightx/VitaDockPlus/releases)  
VitaDock+ is a Linux distribution for Raspberry Pi used to create a PlayStation Vita docking station for video output to a TV.

![Imgur Image](https://i.imgur.com/k2ZPx2m.png)

# Features

- Hardware accelerated across all supported hardware
- Low input latency and accurate colors
- Lanczos upscaling to desired output resolution
- Display power control across all models
- Menu to switch between 960x544 @ 30FPS, 864x488 @ 60FPS, and Plugin Controlled modes
- VitaDock+ themed with fancy splash screen and notifications for visual feedback when changing settings
- Works on most Raspberry Pi models with a single image
- Fits on 4GB SD cards
- Nintendo Switch RCM injection
- Audio via Bluetooth or AUX cable
- Headless configuration using GPIO pins
- Cool experimental features (see below)

# Tested Models

|                Model                 |  Status   |                               Details                               |
| :----------------------------------: | :-------: | :-----------------------------------------------------------------: |
|    Raspberry Pi Zero 2 W Rev 1.0     | Excellent |                                                                     |
| Raspberry Pi 4 Model B Rev 1.1 (4GB) | Excellent |                                                                     |
| Raspberry Pi 4 Model B Rev 1.2 (2GB) | Excellent |                                                                     |
| Raspberry Pi 4 Model B Rev 1.1 (2GB) | Excellent |                                                                     |
| Raspberry Pi 3 Model B Plus Rev 1.3  | Excellent |                                                                     |
|    Raspberry Pi 3 Model B Rev 1.2    | Excellent |                                                                     |
|    Raspberry Pi 2 Model B Rev 1.1    |   Good    |                                                                     |
|     Raspberry Pi Zero W Rev 1.1      |   Works   | Latency makes games unplayable. See performance tips section below. |

To help me verify models please report to me how it is working for you and your exact model. You can get the exact model by opening a terminal with the run menu by running `x-terminal-emulator` then entering `cat /sys/firmware/devicetree/base/model`.

# Requirements

1. A hacked Vita: https://vita.hacks.guide/
2. Latest official vita-udcd-uvc installed on your Vita: https://github.com/xerpi/vita-udcd-uvc
3. A Raspberry Pi with power cable, display cable, and 4GB+ SD/MicroSD card (see tested models above): <a target="_blank" href="https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=silentnightx-20&keywords=raspberry pi&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=5e8cae4be3a18d69a8eb02205751d14c">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
4. Computer with an SD card slot or a USB SD card reader (often included in Raspberry Pi starter kits)
5. Mouse, Keyboard, or GPIO buttons to change settings or connect audio through the dock.

If using AUX audio input there are specific extras needed. Please see [Regarding AUX](#Regarding-AUX) for more information.
If using GPIO buttons instead of a keyboard and mouse see [Control via GPIO](#control-via-gpio) for more information.

# Installation

1. Download the latest release of VitaDock+: https://github.com/SilentNightx/VitaDockPlus/releases/
2. Download and install Raspberry Pi Imager for your operating system: https://www.raspberrypi.org/downloads/
3. Plug in the SD card to your computer and run the Raspberry Pi Imager.
4. When asked to choose OS select the option to use a custom image and select the VitaDock Plus VX.img you downloaded.
5. Choose the SD card to write it to (make sure to select the right one).
6. Click Write. Once it is done it will tell you to remove the SD card.
7. Plug the SD card into your Pi and power it on. Depending on your Pi model it might take awhile to load as it automatically configures the image for you on first boot. If the Pi doesn't boot see the troubleshooting section below.

Any time you see the VitaDock+ desktop you can plug your Vita in through USB to get video output.

# Updating

Check back here for updates and rewrite the image when there is one. Data stored on the dock will be overwritten but this isn't really a distribution you're meant to store data on in the first place.

# Recommended Plugins

MiniVitaTV by TheOfficialFloW: https://github.com/TheOfficialFloW/MiniVitaTV  
Allows the PS Vita to run like a PS TV, enabling DualShock 4 controllers to be connected and makes games load their PS TV control schemes.

PSV-VSH-Menu by joel16: https://github.com/SilentNightx/PSV-VSH-Menu/releases/tag/3.50  
Allows you to set processor states for games, overlay FPS counter, and more. Checking the FPS of a game can be helpful when using VitaDock+ so you can decide what mode you want to use (HD @ 30 or SD @ 60).

# Audio Support

VitaDock+ can handle audio in several ways.

1. Use a 3.5mm AUX cable directly from the Vita into your sound system.
2. Connect to the dock on your Vita using Bluetooth.
3. Use a 3.5mm AUX cable from the Vita into your dock.

## Regarding AUX

There is a humming noise experienced over AUX while the Vita is charging.

To get rid of it you can either disable USB Power Supply in Vita Settings -> System or you can use a ground loop isolator: <a target="_blank" href="https://www.amazon.com/s?k=ground+loop+isolator+3.5mm&sprefix=ground+loop+isolator+%2Caps%2C122&linkCode=ll2&tag=silentnightx-20&linkId=d884a19db1d47e49b7d237c1180c0456&language=en_US&ref_=as_li_ss_tl">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

If sending AUX to the dock instead of directly into your sound system your Pi will need AUX input capabilities which not all Pis have by default. Pis such as the Pi 3 and Pi 4 will need to get an adapter such as this one: <a target="_blank" href="https://www.amazon.com/s?k=raspberry+pi+usb+3.5mm+input&crid=1FYAHN40YYDGO&sprefix=raspberry+pi+usb+3.5mm+input%2Caps%2C101&linkCode=ll2&tag=silentnightx-20&linkId=f39145306a1ed20b43d2e3f710803d96&language=en_US&ref_=as_li_ss_tl">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

Unless you get an interface that supports stereo input you will be limited to mono audio. Depending on the card you get you may also need a 3.5mm stereo to mono adapter: <a target="_blank" href="https://www.amazon.com/s?k=3.5mm+stereo+to+mono+adapter&sprefix=3.5mm+stereo+to+m%2Caps%2C110&linkCode=ll2&tag=silentnightx-20&linkId=08c9d25b0a9a33a5e1c7560c8f5fbcbc&language=en_US&ref_=as_li_ss_tl">Associate Link</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=silentnightx-20&l=ur2&o=1&camp=1789" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

Once you verify your Pi supports it, or you install a USB sound card, you will need to enable AUX input on the dock by going to Menu -> Options -> Use AUX Input. Doing so for the first time will bring you to the configuration tool where you pick your input device. To reconfigure it later you can go to Menu -> Options -> AUX Configuration Tool instead.

Enabling AUX will disable Bluetooth and vice versa.

## Regarding Bluetooth

Bluetooth attempts to use the internal Bluetooth by default. If your Pi doesn't have internal Bluetooth or your Bluetooth is glitching you can try using dongle Bluetooth instead. There are fake CSR Bluetooth dongles going around that don't work so watch out for those:
<a target="_blank" href="https://www.amazon.com/s?k=raspberry+pi+bluetooth+dongle&crid=1HK235R0JUFT5&sprefix=raspberry+pi+bluetooth+dongle%2Caps%2C90&linkCode=ll2&tag=silentnightx-20&linkId=c7b2ee965518dba26c462c0c55bc323b&language=en_US&ref_=as_li_ss_tl" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

To switch between internal Bluetooth and dongle Bluetooth, or reenable BLuetooth when in AUX mode, you can go to Menu -> Options on the dock and select a Bluetooth mode.

To connect to Bluetooth use the Bluetooth icon in the taskbar. Turn on Discovery then Pair from the Vita Settings -> Devices -> Bluetooth Devices menu. Confirm the code on the Vita and the dock. You can then turn off Discovery if you want. For future play sessions you will just need to connect from the Vita Settings menu.

Bluetooth latency and glitching appears to be bad when first connecting but starts to reside quickly. Bluetooth is also very taxing on the Pi so it may not be the best option for older/slower Pis.

Enabling Bluetooth will disable AUX and vice versa.

# Control via GPIO

It's possible to control the VitaDock+ without the need for a mouse and keyboard. GPIO pins, documented below, have been configured to emulate keyboard presses.

This allows not only for first time setup of audio (Bluetooth or AUX) to be configured but also changing of the display settings without a mouse or keyboard.

It's feasible that in the future the available 3D models for docks could be updated to include these buttons. As of now though a user would have to devise their own way to mount these buttons.

**Note** the table below lists the GPIO pin number, that is not to be confused with the physical pin number. For exmaple on a RPi3+ GPIO pin 6 is physical pin 31.

| GPIO Pin | Keyboard key    | Configuration Item |
| -------- | --------------- | ------------------ |
| 21       | Left Arrow Key  | LEFT_KEY_GPIO      |
| 20       | Right Arrow Key | RIGHT_KEY_GPIO     |
| 26       | Up Arrow Key    | UP_KEY_GPIO        |
| 19       | Down Arrow Key  | DOWN_KEY_GPIO      |
| 16       | Windows Key     | WINDOWS_KEY_GPIO   |
| 13       | Escape Key      | ESCAPE_KEY_GPIO    |
| 12       | Enter Key       | ENTER_KEY_GPIO     |
| 6        | Tab Key         | TAB_KEY_GPIO       |

## Changing/Disabling GPIO pins used

It is possible to change the GPIO pin used or disable the functionality completely on a per GPIO pin basis.

This can be achieved by modifying the `vitadock.conf` file see [For Advanced Users](#for-advanced-users). The table above lists the configuration item used for each keyboard key.

Simply change the value to the GPIO pin you would rather use. If you wish to disable the pin entirely set its value to empty, eg: `ENTER_KEY_GPIO=`

## Connecting Buttons

You need a button that is normally open, that is it is not connected when it is not pressed. Nearly all buttons used in Arduino hobby kits and the like behave this way.

One end needs to be connected to the Raspberry PI's GPIO pin, the other end connected to a `Ground` pin.

## Controlling the Dock

Pressing the `Windows Key` will bring up the main menu. `Arrow keys` can then be used to navigate up and down the menu. The `Enter Key` can be used to select an item or open a submenu. The `Escape Key` can be used to close the menu or collapse a submenu.

The `Tab Key` is a special key that allows navigation of the entire Operating System without the need for a mouse. Users who are unable to use a mouse for medical reasons may already be aware of this feature.

This functionality has been added just in case a user may wish to do more than just select menu items.

## Bluetooth discovery via GPIO buttons

It is possible to make the VitaDock+ discoverable via Bluetooth using a GPIO pin. Sending this pin to ground will make the dock discoverable for three minuets.

The default pin is GPIO pin 5 (physical pin 29 on the RPi3+) however this can be changed within the `vitadock.conf` file.

The config item `DISCOVERY_KEY_GPIO` controls which pin is used, setting it to empty will disable this feature.

## Physical Power Button

Connect a physical power button to GPIO 3/SCL (physical pin 5 on the RPi3+) and GND (physical pin 6 on the RPi3+). This is not configurable.

# Nintendo Switch RCM Injection Feature

Name your payload `payload.bin` and place in /boot/nx/. When the Pi detects a Switch in RCM mode over USB it will automatically inject the payload within 3 seconds.

# Cases

https://www.thingiverse.com/thing:3942821  
https://www.thingiverse.com/thing:3502645  
https://www.thingiverse.com/thing:4609317  
https://www.tinkercad.com/things/b0GQwqVYNPP

# Performance Tips

Overclocking and disabling Bluetooth on low powered Pis can also help. Good starting overclock values:

|                   Model                    | arm_freq | core_freq | gpu_freq | sdram_freq | over_voltage | Cooling Required |
| :----------------------------------------: | :------: | :-------: | :------: | :--------: | :----------: | :--------------: |
|         Raspberry Pi 1 Model A & B         |   1000   |    450    |          |            |      6       |                  |
|   Raspberry Pi A+ / B+ / Compute Module    |   1100   |    450    |          |    450     |      6       |       Yes        |
|         Raspberry Pi Zero / Zero W         |   1100   |    450    |          |            |      6       |                  |
|            Raspberry Pi 2 v1.1             |   1000   |    500    |          |            |      2       |                  |
|            Raspberry Pi 2 V1.2             |   1300   |    500    |          |            |      4       |                  |
|     Raspberry Pi 3 & Compute Module 3      |   1300   |    500    |          |            |      4       |                  |
| Raspberry Pi 3 A+ / B+ / Compute Module 3+ |   1500   |           |          |            |      4       |                  |
|               Raspberry Pi 4               |   2100   |           |   750    |            |      6       |                  |

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

Performance issues:

1. Try overclocking.
2. Try disabling Bluetooth on the dock.
3. Try a legacy image if on an older Pi.

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

The features below are still in testing and may not work properly or at all. Support will not be provided for them.

## Nintendo Switch Video Output With SysDVR

This feature allows you to connect a Switch that has SysDVR running in USB mode to get a video output. You need SysDVR 5.3 specifically installed on your Switch and you must be in a game that supports SysDVR when you connect. Doesn't work on Pi 1 or Pi Zero 1. See https://github.com/exelix11/SysDVR for more information.

## Sharpscale Mode

This feature allows you to display native 720p from a Vita using the Sharpscale plugin. You'll need Sharpscale installed on your Vita along with a 1280×720 resolution patch plugin for a game and you need Unlock Framebuffer Size turned on in the Sharpscale config. See https://forum.devchroma.nl/index.php?topic=112.0 for more information.

# Credits

Original VitaDock Team: Bu (m0tie), ZoidBerg, his wife Si (icon and video), David-OX, Crash, and myself.  
Special thanks to Xerpi (vita-udcd-uvc), TheOfficialFloW (various Vita exploits), Team Molecule (HENkaku), Relative (rpi-nx-rcm), and exelix11 (SysDVR).
