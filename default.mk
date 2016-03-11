include ../config.mk

export NAME := $(notdir $(CURDIR))
export IMAGE = $(REPO)/$(NAME):$(TAG)

all: build
	$(MAKE) push
ifeq ($(HEAD),$(MASTER))
	$(MAKE) latest
endif

build:
	git submodule update --init --recursive --checkout .
	$(BUILD) $(FLAGS) -t $(IMAGE) .

latest:
	$(DTAG) -f $(IMAGE) $(REPO)/$(NAME)
	$(PUSH) $(REPO)/$(NAME)

push:
	$(PUSH) $(IMAGE)

pull:
	$(PULL) $(IMAGE)

LABEL = $(shell echo $@ | tr 'a-z' 'A-Z')

install uninstall run:
	$(shell $(INSPECT) -f {{.Config.Labels.$(LABEL)}} $(IMAGE))

clean:
	git clean -fdx .
