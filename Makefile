include config.mk

TARGETS := $(shell dirname $(wildcard [!_]*/Makefile))

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ $(TARGET)

$(BASE):
ifneq (,$(findstring B,$(MAKEFLAGS)))
	$(MAKE) -C _base $(TARGET)
endif

.deps.mk~: Makefile
	@for x in $(wildcard [!_]*/Dockerfile); do \
		echo -n "$$(dirname $$x): "; \
		head -n1 $$x | awk -F/ '{print $$(NF)}' | awk -F: '{print $$1}'; \
	done | $(SEDVARS) > $@

-include .deps.mk~

clean:
	$(RM) .*~
	$(GIT) clean -fdx */

.PHONY: $(BASE) $(TARGETS) clean
