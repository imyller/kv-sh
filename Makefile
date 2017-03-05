PREFIX ?= /usr/local
DESTDIR ?=

all:

install:
	install -d $(DESTDIR)$(PREFIX)/lib
	install -m 0755 kv-sh $(DESTDIR)$(PREFIX)/lib/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/lib/kv-sh

test:
	./kv-test
