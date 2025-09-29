# damnusb
Enable and disable USB ports with one command (including camera, card reader, and hub)

## Build
```sh
    sudo git clone https://github.com/osipenco/damn-usb
    cd damn-usb
    sudo make install
```

## Usage
```sh
    # Help
    damnusb -h

    # Disable all ports
    sudo damnusb enable

    # Disable all ports except a device
    sudo damnusb enable -a idVendor=3d24,idProduct=1234

    # See more in the usage message
```
