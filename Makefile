install:
	echo "Installing Damn USB..."
	cp 99-damnusb.rules.disable /etc/udev/rules.d/
	cp damnusb /usr/local/bin/damnusb
	chmod +x /usr/local/bin/damnusb
	echo "Damn USB installed"
uninstall:
	echo "Uninstalling Damn USB..."
	rm -f /etc/udev/rules.d/99-damnusb.rules
	rm -f /etc/udev/rules.d/99-damnusb.rules.disable
	rm /usr/local/bin/damnusb
	udevadm control --reload && udevadm trigger
	echo "Damn USB uninstalled"
