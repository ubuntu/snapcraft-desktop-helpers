#!/usr/bin/make -f

FLAVOR ?= gtk3
SRC_DIR ?= .

DEST_LAUNCHER = desktop-launch
FLAVOR_FILE = flavor-select

build: $(DEST_LAUNCHER)

clean:
	rm -f $(DEST_LAUNCHER)
	rm -f $(FLAVOR_FILE)

$(DEST_LAUNCHER):
	@echo "#!/bin/bash" > $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/init >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/runtime-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/desktop-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/launcher-specific >> $(DEST_LAUNCHER)
	@echo "USE_$(FLAVOR)=true" >> $(FLAVOR_FILE)
		
install: $(DEST_LAUNCHER)
	install -D -m755 $(DEST_LAUNCHER) $(DESTDIR)/bin/$(DEST_LAUNCHER)
	install -D -m644 $(FLAVOR_FILE) $(DESTDIR)/
