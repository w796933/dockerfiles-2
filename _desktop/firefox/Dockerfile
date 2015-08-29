FROM nightling/base-gui:22
MAINTAINER Nightling

RUN dnf -y install firefox \
	&& dnf clean all

ENTRYPOINT ["firefox"]
