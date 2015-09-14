FROM quay.io/nightling/base-desktop:fc22
MAINTAINER Nightling

RUN dnf -y install hexchat enchant \
	&& dnf clean all

ENTRYPOINT ["hexchat"]
