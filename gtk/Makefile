#!/usr/bin/make -f

DEST_LAUNCHER = desktop-launch

SRC_DIR ?= .

build: $(DEST_LAUNCHER)

clean:
	rm -f $(DEST_LAUNCHER)

$(DEST_LAUNCHER):
	@echo "#!/bin/bash" > $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/desktop-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/launcher-specific >> $(DEST_LAUNCHER)
		
install: $(DEST_LAUNCHER)
	install -D -m755 $(DEST_LAUNCHER) $(DESTDIR)/bin/$(DEST_LAUNCHER)
