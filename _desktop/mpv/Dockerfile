FROM nightling/base-gui:22
MAINTAINER Nightling

RUN dnf -y install /usr/src/rpmfusion/*release-22.noarch.rpm \
	&& dnf -y install mpv youtube-dl \
	&& dnf clean all

ENTRYPOINT ["entrypoint", "mpv"]
