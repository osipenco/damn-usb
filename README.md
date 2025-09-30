# damnusb
Enable and disable all USB ports with one command (including camera, bluetooth, card reader, and hub)

## Build
```bash
    sudo git clone https://github.com/osipenco/damn-usb
    cd damn-usb
    sudo make install
```

## Usage
```bash
    # Help
    damnusb -h

    # Disable all ports
    sudo damnusb enable

    # Disable all ports except a device
    sudo damnusb enable -a idVendor=3d24,idProduct=1234

    # See more in the usage message
```
