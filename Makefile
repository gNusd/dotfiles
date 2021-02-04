### INCOMPLETE

.POSIX:

OS = $(shell uname -s)
ifndef PREFIX
  PREFIX = $HOME/.local
endif
ifndef MANPREFIX
  MANPREFIX = $(PREFIX)/share/man
endif

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	mkdir -p $(DESTDIR)$(PREFIX)/share/
	chmod 755 $(DESTDIR)$(PREFIX)/share/
	for shared in share/*; do \
		cp -f $$shared $(DESTDIR)$(PREFIX)/share; \
		chmod 644 $(DESTDIR)$(PREFIX)/share/$$(basename $(notdir $$shared)); \
	done
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f mw.1 $(DESTDIR)$(MANPREFIX)/man1/
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/
	if [ "$(PREFIX)" ]; then \
		sed -iba 's:/usr/local:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/ \
		rm -f $(DESTDIR)$(PREFIX)/share/ \
		sed -iba 's:/usr/local:$(PREFIX):' $(DESTDIR)$(PREFIX)/bin/ \
		rm -f $(DESTDIR)$(PREFIX)/bin/; \
		sed -iba 's:/usr/local:$(PREFIX):' $(DESTDIR)$(MANPREFIX)/man1/; \
		rm -f $(DESTDIR)$(MANPREFIX)/man1/ \
	fi

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/
	rm -f $(DESTDIR)$(MANPREFIX)/man1/

.PHONY: install uninstall
