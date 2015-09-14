FROM quay.io/nightling/base-desktop:fc22
MAINTAINER Nightling

RUN dnf -y install firefox \
	&& dnf clean all

ENTRYPOINT ["firefox"]
