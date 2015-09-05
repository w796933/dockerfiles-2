FROM nightling/base-gui:22
MAINTAINER Nightling

RUN dnf -y install hexchat enchant \
	&& dnf clean all

ENTRYPOINT ["hexchat"]
