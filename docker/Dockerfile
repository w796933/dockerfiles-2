FROM quay.io/nightling/fedora:22
MAINTAINER Nightling

RUN dnf -y install docker \
	btrfs-progs \
	device-mapper \
	e2fsprogs \
	lxc \
	&& dnf clean all

COPY wrapdocker /usr/local/bin/

VOLUME /var/lib/docker

CMD ["wrapdocker"]
