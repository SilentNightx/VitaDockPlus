# VitaDock+ Readme For Developers
Find almost everything in /home/pi/  

## Descriptions of scripts:
1stboot.sh - Displays the first boot message intro.txt if 1.txt doesn't exist in /home/pi/ and then creates 1.txt.  
autorun.sh - The commands in this script run when the Desktop starts loading. It's called by /home/pi/.config/autostart/vita.desktop.  
boot_txt_d.sh - Disables boot messages.  
boot_txt_e.sh - Enables boot messages.  
d.sh - Contains commands that are run when a Vita is unplugged. It is called by /etc/udev/rules.d/92-dvita.rules.  
disablelowlatency.sh - Disables low latency mode and reboots.  
format.sh - Deletes 1.txt and reboots.  
fps.sh - Sets the contents of vitadock.conf to fps.  
lowlatency.sh - Enables low latency mode and reboots.  
pc.sh - Sets the contents of vitadock.conf to pc.  
res.sh - Sets the contents of vitadock.conf to res.  
run.sh - Contains commands that are run when a Vita is plugged in. It is called by /etc/systemd/user/vita.service which is called by /etc/udev/rules.d/91-vita.rules.  
screensaveroff.sh - Disables the screensaver.  
screensaveron.sh - Enables the screensaver.  
sharpscale.sh - Sets the contents of vitadock.conf to sharp.  
switchbt.sh - Switches to dongle bluetooth.  
switchbtti.sh - Switches to internal bluetooth.  

## Development notes:  
1. To build ffmpeg and ffplay for Pis with hardware acceleration first enable a large swapfile by editing /etc/dphys-swapfile and rebooting. Your Pi needs enough RAM to compile. I used half the remaining space on my SD.
Once that is done enter the following commands:  
`sudo apt-get install libomxil-bellagio-dev -y`  
`git clone https://github.com/FFmpeg/FFmpeg.git`  
`cd FFmpeg`  
`sudo ./configure --extra-ldflags=-latomic --arch=armel --target-os=linux --enable-ffplay --enable-omx --enable-omx-rpi --enable-mmal --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx`  
then on RPI 0/1 `sudo make` or on RPI 2/3/4 `sudo make -j4`  
That step can take a long time and once it is done you need to enter `sudo make install` then reboot.  
After compiling you may want to disable the swap again as this can help performance while streaming the video.

2. When adding a new UDEV rule on Pi you need to run `sudo /etc/init.d/udev restart` or it won't be seen by the OS.

3. Pi 0-3 support hardware acceleration when using the legacy graphics driver but the Pi 4 does not and needs the OpenGL Fake KMS driver to use hardware acceleration. When enabling the OpenGL Fake KMS driver on some old Pis they can fail to show display on boot. This means running hardware specific code is required. An example of this can be seen in autorun.sh.

4. Using the following is required for the viewer to display at all on Pi 4:  
`export DISPLAY=:0`  
`export XAUTHORITY=/home/pi/.Xauthority`  
If setting those environment variables on the Pi Zero and maybe some other Pis then the viwer runs at less than 1fps for some reason.  
Other Pis don't seem to care if this is set or not.  
There are hardware specific commands in run.sh to set these variables.  

5. Editing vita-udcd-uvc and making a ton of versions is not a good idea since the linux v4l2-ctl command lets you set UVC modes. Examples can be seen in run.sh.
Running `v4l2-ctl -d 0 --list-formats-ext` can show you a list of UVC modes the Vita that is plugged in supports.

6. Running `sudo journalctl -f -u vita` and then plugging the Vita in shows what code is run when the Vita is plugged in. Can be helpful when debugging.

7. To shrink the image use win32diskimager to get an image. Put the image on a USB drive then plug it into the Pi and boot with the SD you imaged. Run `termit` then navigate to the folder where the image is on your USB drive. Next run `sudo pishrink.sh -s -p 'name of your image`. Make sure you use the -s option. This disables filesystem expansion on first boot which is a broken feature at the moment that will corrupt the filesystem. Also make sure to use -p to remove any logs that might contain sensitive information.
