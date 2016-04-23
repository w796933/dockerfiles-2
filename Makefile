include config.mk

TARGETS := $(shell dirname $(wildcard */Makefile))

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ $(TARGET)

$(BASE):
ifneq (,$(findstring B,$(MAKEFLAGS)))
	$(MAKE) -C .base $(TARGET)
endif

.deps.mk~: Makefile
	@for x in $(wildcard */Dockerfile); do \
		echo -n "$$(dirname $$x): "; \
		head -n1 $$x | awk -F/ '{print $$(NF)}' | awk -F: '{print $$1}'; \
	done | $(SEDVARS) > $@

-include .deps.mk~

clean:
	$(RM) .*~
	$(GIT) clean -fdx .base */

.PHONY: $(BASE) $(TARGETS) clean
