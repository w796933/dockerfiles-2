include ../config.mk ./config.mk

all: build
	$(MAKE) push
ifeq ($(HEAD) $(origin OSREL) $(origin DIST),$(BASE) file file)
	$(MAKE) latest
endif

rootfs.$(DIST).tar:
	@$(DOCKER) run --rm -v "$(CURDIR):/mnt:z" -w /mnt -v /rootfs \
		$(foreach x,$(VARS),-e $(x)="$($(x))") \
		$(BUILDIMG) ./make-rootfs.sh $@

build: rootfs.$(DIST).tar
	@$(SEDVARS) Dockerfile > .Dockerfile~
	$(DOCKER) build $(BFLAGS) -t $(IMAGE) -f .Dockerfile~ .

push pull rmi history inspect:
	$(DOCKER) $@ $(IMAGE)

latest:
	$(DOCKER) tag $(IMAGE) $(REGISTRY)/$(BASE)
	$(DOCKER) push $(REGISTRY)/$(BASE)

clean:
	$(GIT) clean -fdx .

.PHONY: build push pull rmi history inspect latest clean
