install:
	echo "Installing Damn USB..."
	cp damnusb /usr/local/bin/damnusb
	chmod +x /usr/local/bin/damnusb
	echo "Damn USB installed"
uninstall:
	echo "Uninstalling Damn USB..."
	rm /usr/local/bin/damnusb
	echo "Damn USB uninstalled"
