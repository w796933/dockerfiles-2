FROM quay.io/oszi/fedora:22

RUN dnf -y install docker \
	btrfs-progs \
	device-mapper \
	e2fsprogs \
	lxc \
	&& dnf clean all

LABEL RUN /usr/bin/docker run -it --privileged --name=\${NAME} -e NAME=\${NAME} \
	-e IMAGE=\${IMAGE} \${OPT1} \${IMAGE}

COPY wrapdocker /usr/local/bin/

VOLUME /var/lib/docker

CMD ["wrapdocker"]
