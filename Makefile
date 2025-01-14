LDFLAGS = -lkrun
CFLAGS = -O2

ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

.PHONY: clean

all: krun krun-guest

krun: krun.c
	gcc -o $@ $< $(CFLAGS) $(LDFLAGS)

krun-guest: krun-guest.c
	gcc -o $@ $< $(CFLAGS) $(LDFLAGS)

clean:
	rm -rf krun krun-guest

install:
	install -m 755 krun $(PREFIX)/bin
	install -m 755 krun-guest $(PREFIX)/bin
