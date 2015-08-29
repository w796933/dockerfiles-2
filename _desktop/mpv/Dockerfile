FROM nightling/base-gui:22
MAINTAINER Nightling

RUN dnf -y install /usr/share/rpmfusion/*release-22.noarch.rpm \
	&& dnf -y install mpv youtube-dl \
	&& dnf clean all

ENTRYPOINT ["mpv"]
