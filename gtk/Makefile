#!/usr/bin/make -f

FLAVOR ?= gtk3
SRC_DIR ?= .

DEST_LAUNCHER = desktop-launch
FLAVOR_FILE = flavor-select
BINDTEXTDOMAIN = bindtextdomain.so

build: $(DEST_LAUNCHER)

clean:
	rm -f $(DEST_LAUNCHER)
	rm -f $(FLAVOR_FILE)
	rm -f $(BINDTEXTDOMAIN)

$(DEST_LAUNCHER):
	@echo "#!/bin/bash" > $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/init >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/runtime-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/desktop-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/launcher-specific >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/mark-and-exec >> $(DEST_LAUNCHER)
	@echo "USE_$(FLAVOR)=true" >> $(FLAVOR_FILE)
	gcc -Wall -O2 -o $(BINDTEXTDOMAIN) -fPIC -shared $(SRC_DIR)/../src/bindtextdomain.c -ldl
		
install: $(DEST_LAUNCHER)
	install -D -m755 $(DEST_LAUNCHER) "$(DESTDIR)"/bin/$(DEST_LAUNCHER)
	install -D -m644 $(FLAVOR_FILE) "$(DESTDIR)"/
	install -D -m644 $(BINDTEXTDOMAIN) "$(DESTDIR)"/lib/$(BINDTEXTDOMAIN)
