include ../config.mk ./config.mk

all: build
	$(MAKE) push

rootfs.$(DIST).tar:
	@$(DOCKER) run --rm -v "$(CURDIR):/mnt:z" -w /mnt -v /rootfs \
		$(foreach x,$(VARS),-e $(x)="$($(x))") \
		$(BUILDIMG) ./make-rootfs.sh $@

build: rootfs.$(DIST).tar
	@$(SEDVARS) Dockerfile > .Dockerfile~
	$(DOCKER) build $(BFLAGS) -t $(IMAGE) -f .Dockerfile~ .

push pull rmi:
	$(DOCKER) $@ $(IMAGE)

latest:
	$(info Base images must be tagged)

clean:
	$(GIT) clean -fdx .

.PHONY: build push pull latest rmi clean
