#!/bin/bash
# setup-shutdown.sh 
# Installs python script to enable safe shutdown of Raspberry Pi on PIN5/GPIO3 Logic LOW
# Author:  8bitjunkie.net
# Adapted from https://svn.nwesd.org/linuxdev/config_samples/lenny_setup/setup-denyhosts

# INSTRUCTIONS:
# Download and run this setup script in the terminal using the following command:
#  curl http://pie.8bitjunkie.net/shutdown/setup-shutdown.sh | bash

###################################################################################################################
# Copyright 2017 8bitjunkie.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###################################################################################################################

set -u # fail on unset vars

echo; echo
echo -e "\e[96mThis script will install a python script to enable shutdown of Raspberry Pi upon PIN5/GPIO3 Logic LOW\e[0m"
echo; echo
echo -e "\e[96mVisit \e[4;96mhttp://pie.8bitjunkie.net\e[0;96m for more information\e[0m"
echo; echo
sleep 5

#update packages and install python.gpio
echo -e "\033[31mUpdating packages\e[0m"
sudo apt-get -y update 

echo; echo
echo -e "\033[31mInstalling python.gpio\e[0m"
sudo apt-get install --yes python-rpi.gpio python3-rpi.gpio </dev/null

#download scripts etc
mkdir /home/pi/scripts &> /dev/null
echo; echo
echo -e "\033[31mDownloading shutdown scripts\e[0m"
curl -# "http://pie.8bitjunkie.net/shutdown/shutdown.py" > /home/pi/scripts/shutdown.py 
curl -# "http://pie.8bitjunkie.net/shutdown/shutdown.rc" > /tmp/pi_shutdown
sudo mv /tmp/pi_shutdown  /etc/init.d/pi_shutdown; chmod +x /etc/init.d/pi_shutdown
#fixme need a check here to see if curl was successful or not, also add retry options

echo; echo
echo -e "\033[31mAdd pi_shutdown to rc.d\e[0m"
sudo update-rc.d pi_shutdown defaults

#start shutdown.py now to avoid requiring reboot
echo; echo
echo -e "\033[31mRunning shutdown listener\e[0m"
sudo python /home/pi/scripts/shutdown.py &> /dev/null &

echo; echo
echo -e "\033[31mShutdown is now installed\e[0m"
echo; echo

exit 0