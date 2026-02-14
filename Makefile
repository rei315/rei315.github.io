IGNITE ?= ignite

.PHONY: build run

build:
	$(IGNITE) build

run: build
	$(IGNITE) run --preview
