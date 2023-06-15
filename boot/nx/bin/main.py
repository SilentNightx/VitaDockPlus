import sys
sys.path.append('/boot/nx/fusee')
import fusee_launcher as hax
import usb
NX_VID = 0x0955
NX_PID = 0x7321

def loop():
  device = None
  while device is None:
    device = usb.core.find(idVendor=NX_VID, idProduct=NX_PID)
  if device is None:
    return
  print('Found a Tegra device in ReCovery Mode!')
  hax.main(payload='/boot/nx/payload.bin', wait=True, vid=NX_VID, pid=NX_PID, platform='linux', skip_checks=False, permissive_id=False)

def main():
  print('Started rpi-nx-rcm auto-exploiter')
  try:
    while True:
      loop()
  except KeyboardInterrupt:
    print('Terminating (this shouldn\'t happen')
    sys.exit(0)

if __name__ == '__main__':
  main()