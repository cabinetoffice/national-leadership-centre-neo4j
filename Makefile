include docker.mk

.PHONY: test

NEO4J_VER ?= 3.5

test:
	cd ./tests/$(NEO4J_VER) ./run