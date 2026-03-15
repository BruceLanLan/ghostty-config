SHELL := /bin/sh

PREFIX ?= $(HOME)/.config
DESTDIR ?=
GHOSTTY_DIR := $(PREFIX)/ghostty
TARGET := $(DESTDIR)$(GHOSTTY_DIR)/config
SOURCE := config

.PHONY: all install uninstall help

all: help

install: $(SOURCE)
	@install -d "$(DESTDIR)$(GHOSTTY_DIR)"
	@install -m 0644 "$(SOURCE)" "$(TARGET)"
	@printf 'Installed %s -> %s\n' "$(SOURCE)" "$(TARGET)"

uninstall:
	@rm -f "$(TARGET)"
	@printf 'Removed %s\n' "$(TARGET)"

help:
	@printf 'Targets:\n'
	@printf '  make install    Install config to %s\n' "$(TARGET)"
	@printf '  make uninstall  Remove installed config from %s\n' "$(TARGET)"
