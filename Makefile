CC ?= gcc
AR ?= ar
RANLIB ?= ranlib
STRIP ?= strip

CFLAGS += -I.
LDFLAGS += -static

ifdef FB
	CFLAGS += -DFB
endif

SRC = src/*.c

shorkset: $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o shorkset $(LDFLAGS)
	$(STRIP) shorkset

PREFIX ?= /usr
BINDIR = $(PREFIX)/libexec
CONFDIR = /etc

install: shorkset
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 shorkset $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(CONFDIR)
	install -m 644 shorkset.conf $(DESTDIR)$(CONFDIR)
uninstall:
	rm -f $(DESTDIR)$(BINDIR)/shorkset
	rm -f $(DESTDIR)$(CONFDIR)/shorkset.conf

clean:
	rm -f shorkset

.PHONY: install uninstall clean
