PREFIX = /usr/local
TARGET = damnusb

TAB   := "\040\040"
GREEN := "\033[32m"
NC    := "\033[0m"

install:
	@echo "Installing damnusb..."
	@echo -n $(GREEN)$(TAB)
	cp $(TARGET) $(PREFIX)/bin/
	@echo -n $(TAB)
	chmod +x $(PREFIX)/bin/$(TARGET)
	@echo -n $(NC)
	@echo "damnusb installed."

uninstall:
	@echo "Uninstalling damnusb..."
	@echo -n $(GREEN)$(TAB)
	rm -f $(PREFIX)/bin/$(TARGET)
	@echo -n $(NC)
	@echo "damnusb uninstalled."
