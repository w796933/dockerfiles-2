INAME := $(notdir $(CURDIR))
export IMAGE := $(REGISTRY)/$(INAME):$(DIST)
export NAME  := $(INAME)

all: build
	$(MAKE) push
ifeq ($(origin OSREL) $(HEAD),file master)
	$(MAKE) latest
endif

build:
	$(GIT) submodule update --init --recursive --checkout .
	@$(SEDVARS) Dockerfile > .Dockerfile~
	$(DOCKER) build $(BFLAGS) -t $(IMAGE) -f .Dockerfile~ .

latest:
	$(DOCKER) tag -f $(IMAGE) $(REGISTRY)/$(INAME)
	$(DOCKER) push $(REGISTRY)/$(INAME)

push pull rmi:
	$(DOCKER) $@ $(IMAGE)

LABEL = $(shell echo $@ | tr a-z A-Z)

install uninstall run stop:
	$(shell $(DOCKER) inspect -f {{.Config.Labels.$(LABEL)}} $(IMAGE)) $(ARGV)

erase: ARGV = erase
erase: uninstall

clean:
	$(GIT) clean -fdx .

.PHONY: build latest push pull rmi install uninstall run stop clean
