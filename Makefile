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
DATDIR = $(PREFIX)/share/shorkset

install: shorkset
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 shorkset $(DESTDIR)$(BINDIR)

	install -d $(DESTDIR)$(DATDIR)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/shorkset

clean:
	rm -f shorkset

.PHONY: install uninstall clean
