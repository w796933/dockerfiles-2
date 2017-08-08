INAME := $(notdir $(CURDIR))
VARS  += INAME

export IMAGE := $(REGISTRY)/$(INAME):$(DIST)
export NAME  := $(INAME)

all: build
	$(MAKE) push
ifeq ($(HEAD) $(origin OSREL) $(origin DIST),master file file)
	$(MAKE) latest
endif

build:
	@$(SEDVARS) Dockerfile > .Dockerfile~
	$(DOCKER) build $(BFLAGS) -t $(IMAGE) -f .Dockerfile~ .

latest:
	$(DOCKER) tag $(IMAGE) $(REGISTRY)/$(INAME)
	$(DOCKER) push $(REGISTRY)/$(INAME)

push pull rmi history inspect:
	$(DOCKER) $@ $(IMAGE)

LABEL = $(shell echo $@ | tr a-z A-Z)

install uninstall run stop:
	$(shell $(DOCKER) inspect -f {{.Config.Labels.$(LABEL)}} $(IMAGE)) $(ARGV)

update: ARGV = update
update: install

erase: ARGV = erase
erase: uninstall

clean:
	$(GIT) clean -fdx .

.PHONY: build latest push pull rmi history inspect install uninstall run stop clean
