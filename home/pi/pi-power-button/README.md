# pi-power-button

Scripts used in our official [Raspberry Pi power button guide](https://howchoo.com/g/mwnlytk3zmm/how-to-add-a-power-button-to-your-raspberry-pi).

## Installation

1. [Connect to your Raspberry Pi via SSH](https://howchoo.com/g/mgi3mdnlnjq/how-to-log-in-to-a-raspberry-pi-via-ssh)
1. Clone this repo: `git clone https://github.com/Howchoo/pi-power-button.git`
1. Optional: Edit line 9/10 in listen-for-shutdown.py to your preferred pin (Please see "Is it possible to use another pin other than Pin 5 (GPIO 3/SCL)?" below!)
1. Run the setup script: `./pi-power-button/script/install`

## Uninstallation

If you need to uninstall the power button script in order to use GPIO3 for another project or something:

1. Run the uninstall script: `./pi-power-button/script/uninstall`

## Hardware

A full list of what you'll need can be found [here](https://howchoo.com/g/mwnlytk3zmm/how-to-add-a-power-button-to-your-raspberry-pi#parts-list). At a minimum, you'll need a normally-open (NO) power button, some jumper wires, and a soldering iron. If you _don't_ have a soldering iron or don't feel like breaking it out, you can use [this prebuilt button](https://howchoo.com/shop/product/prebuilt-raspberry-pi-power-button?utm_source=github&utm_medium=referral&utm_campaign=git-repo-readme) instead.

Connect the power button to Pin 5 (GPIO 3/SCL) and Pin 6 (GND) as shown in this diagram:

![Connection Diagram](https://raw.githubusercontent.com/Howchoo/pi-power-button/master/diagrams/pinout.png)

### Is it possible to use another pin other than Pin 5 (GPIO 3/SCL)?

Not for full functionality, no. There are two main features of the power button:

1. **Shutdown functionality:** Shut the Pi down safely when the button is pressed. The Pi now consumes zero power.
1. **Wake functionality:** Turn the Pi back on when the button is pressed again.

The **wake functionality** requires the SCL pin, Pin 5 (GPIO 3). There's simply no other pin that can "hardware" wake the Pi from a zero-power state. If you don't care about turning the Pi back _on_ using the power button, you could use a different GPIO pin for the **shutdown functionality** and still have a working shutdown button. Then, to turn the Pi back on, you'll just need to disconnect and reconnect power (or use a cord with a physical switch in it) to "wake" the Pi.

Of course, for the GND connection, you can use [any other ground pin you want](https://pinout.xyz/).
