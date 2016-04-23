INAME := $(notdir $(CURDIR))
export IMAGE := $(REPO)/$(INAME):$(DIST)
export NAME  := $(INAME)

all: build
	$(MAKE) push
ifeq ($(origin RELEASE) $(HEAD),file master)
	$(MAKE) latest
endif

build:
	@$(SEDVARS) Dockerfile > .Dockerfile~
	$(GIT) submodule update --init --recursive --checkout .
	$(DOCKER) build $(BFLAGS) -t $(IMAGE) -f .Dockerfile~ .

latest:
	$(DOCKER) tag -f $(IMAGE) $(REPO)/$(INAME)
	$(DOCKER) push $(REPO)/$(INAME)

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
