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

submodule-update-init:
	@$(GIT) submodule update --force --checkout --init --recursive

submodule-update-remote:
	@$(GIT) submodule update --force --checkout --remote \
	$(patsubst submodule.%.autoupdate,%,\
	$(shell $(GIT) config -f .gitmodules --name-only --get-regexp '\.autoupdate$$' true))

clean:
	$(RM) .*~
	$(GIT) clean -fdx */

.PHONY: $(BASE) $(TARGETS) submodule-update-init submodule-update-remote clean
