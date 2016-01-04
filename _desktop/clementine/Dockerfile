FROM oszi/base-desktop:fc23

RUN dnf -y install clementine flac-libs \
	&& dnf -y install /usr/share/rpmfusion/*-$(rpm -E %fedora).noarch.rpm \
	&& dnf -y install gstreamer-plugins-{bad-{free,nonfree},good{-extras,},ugly} \
	&& dnf clean all

COPY clementine* /usr/share/install/

ENTRYPOINT ["clementine"]
