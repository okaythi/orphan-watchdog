PREFIX ?= /usr
DESTDIR ?=

.PHONY: all install deb clean

all:
	@echo "Run 'sudo make install' to install, or 'make deb' to build the debian package."

install:
	install -Dm755 bin/orphan-watchdog $(DESTDIR)$(PREFIX)/bin/orphan-watchdog
	install -Dm755 bin/mcp-guardian $(DESTDIR)$(PREFIX)/bin/mcp-guardian
	install -Dm644 config/orphan-watchdog.conf $(DESTDIR)/etc/orphan-watchdog.conf
	install -Dm644 systemd/orphan-watchdog.service $(DESTDIR)/lib/systemd/system/orphan-watchdog.service
	install -Dm644 systemd/orphan-watchdog.timer $(DESTDIR)/lib/systemd/system/orphan-watchdog.timer

deb:
	@rm -rf build-deb
	@mkdir -p build-deb/DEBIAN build-deb/usr/bin build-deb/etc build-deb/lib/systemd/system
	@cp -a debian/* build-deb/DEBIAN/
	@cp -a bin/* build-deb/usr/bin/
	@cp -a config/* build-deb/etc/
	@cp -a systemd/* build-deb/lib/systemd/system/
	@chmod 755 build-deb/DEBIAN/postinst build-deb/DEBIAN/prerm build-deb/DEBIAN/postrm build-deb/usr/bin/*
	dpkg-deb --build --root-owner-group build-deb orphan-watchdog_1.0.4_all.deb
	@rm -rf build-deb

clean:
	rm -rf build-deb *.deb
