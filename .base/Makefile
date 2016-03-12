include ../config.mk

all: build
	$(MAKE) push

build:
	./make-image.sh $(REPO) $(BASE) $(RELEASE)

push:
	$(PUSH) $(REPO)/$(BASE):$(RELEASE)

pull:
	$(PULL) $(REPO)/$(BASE):$(RELEASE)

clean:
	$(RM) -r /var/cache/dnf/* /var/tmp/$(BASE)-*-*
	git clean -fdx .

.PHONY: build push pull clean
