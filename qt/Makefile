#!/usr/bin/make -f

DEST_LAUNCHER = desktop-launch

SRC_DIR ?= .

arch_triplet := $(shell dpkg-architecture -q DEB_TARGET_MULTIARCH)

define QT5_CONF
./usr/lib/$(arch_triplet)/qt5/bin
./usr/lib/$(arch_triplet)
endef
export QT5_CONF

define QT4_CONF
./usr/lib/$(arch_triplet)/qt4/bin
./usr/lib/$(arch_triplet)
endef
export QT4_CONF


all: $(DEST_LAUNCHER)

clean:
	rm -f $(DEST_LAUNCHER)
	rm -rf snappy-qt*.conf

desktop-launch:
	@echo "#!/bin/bash" > $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/desktop-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/launcher-specific >> $(DEST_LAUNCHER)
	@echo "$$QT5_CONF" > snappy-qt5.conf
	@echo "$$QT5_CONF" > snappy-qt4.conf
		
install: desktop-launch
	install -D -m755 $(DEST_LAUNCHER) $(DESTDIR)/bin/$(DEST_LAUNCHER)
	install -D -m644 snappy-qt5.conf \
		$(DESTDIR)/etc/xdg/qtchooser/snappy-qt5.conf
	install -D -m644 snappy-qt4.conf \
		$(DESTDIR)/etc/xdg/qtchooser/snappy-qt4.conf

