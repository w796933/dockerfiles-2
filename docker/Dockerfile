FROM quay.io/oszi/fedora:22

RUN dnf -y install docker \
	btrfs-progs \
	device-mapper \
	e2fsprogs \
	lxc \
	&& dnf clean all

COPY wrapdocker /usr/local/bin/

VOLUME /var/lib/docker

CMD ["wrapdocker"]
