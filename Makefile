# Copyright © 2017 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

user = $(shell id -un)
gecos = $(shell getent passwd $(user) | cut -d: -f5)

.PHONY: all
all: startup

.PHONY: clean
clean:
	rm -f startup *.tmp

startup: startup.in
	sed -e "s/@user@/'$(user)'/; s/@gecos@/'$(gecos)'/" < $(<) > $(@).tmp
	chmod +x $(@).tmp
	mv $(@).tmp $(@)

# vim:ts=4 sts=4 sw=4 noet
