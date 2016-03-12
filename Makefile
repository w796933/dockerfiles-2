include config.mk

TARGETS := $(shell ls */Makefile | xargs dirname)

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@

$(BASE):
	$(info .base=$(BASE):$(RELEASE))

.deps.mk~: Makefile
	@for x in $(wildcard */Dockerfile); do \
		echo -n "$$(dirname $$x): "; \
		head -n1 $$x | awk -F/ '{print $$(NF)}' | awk -F: '{print $$1}'; \
	done > $@

-include .deps.mk~

clean:
	$(RM) .*.mk~
	git clean -fdx .base */

.PHONY: $(BASE) $(TARGETS) clean
