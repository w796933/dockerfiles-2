FROM quay.io/nightling/fedora:22
MAINTAINER Nightling

RUN dnf -y install docker lxc \
	&& dnf clean all

COPY wrapdocker /usr/local/bin/

VOLUME /var/lib/docker

CMD ["wrapdocker"]
