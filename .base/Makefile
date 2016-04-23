include ../config.mk

all: build
	$(MAKE) push

build:
	$(GIT) submodule update --init --recursive --checkout .
	./make-image.sh $(REPO) $(BASE) $(RELEASE)

push pull rmi:
	$(DOCKER) $@ $(REPO)/$(BASE):$(RELEASE)

latest:
	$(info Base images must be tagged)

clean:
	$(RM) -r /var/cache/dnf/* /var/tmp/$(BASE)-*-*
	$(GIT) clean -fdx .

.PHONY: build push pull latest rmi clean
