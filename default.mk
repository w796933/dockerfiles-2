INAME := $(notdir $(CURDIR))
export IMAGE := $(REPO)/$(INAME):$(TAG)
export NAME  := $(INAME)

all: build
	$(MAKE) push
ifeq ($(HEAD),master)
	$(MAKE) latest
endif

build:
	$(GIT) submodule update --init --recursive --checkout .
	$(BUILD) $(BFLAGS) -t $(IMAGE) .

latest:
	$(DTAG) -f $(IMAGE) $(REPO)/$(INAME)
	$(PUSH) $(REPO)/$(INAME)

push:
	$(PUSH) $(IMAGE)

pull:
	$(PULL) $(IMAGE)

LABEL = $(shell echo $@ | tr a-z A-Z)

install uninstall run:
	$(shell $(INSPECT) -f {{.Config.Labels.$(LABEL)}} $(IMAGE)) $(ARGV)

erase: ARGV = erase
erase: uninstall

clean:
	$(GIT) clean -fdx .

.PHONY: build latest push pull install uninstall run clean
