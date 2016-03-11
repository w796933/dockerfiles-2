include ./config.mk

TARGETS := $(shell ls */Makefile | xargs dirname)
BASE_TARGET := _base

all: $(TARGETS)

toolbox jekyll: buildpack

pwnie: toolbox

$(TARGETS): $(BASE_TARGET)
	$(MAKE) -C $@

clean:
	-docker images -qf dangling=true | xargs -r docker rmi
	git reset --hard HEAD
	git clean -fdx

.PHONY: $(TARGETS) all clean
