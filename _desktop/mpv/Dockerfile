FROM quay.io/oszi/base-desktop:fc22

RUN dnf -y install /usr/share/rpmfusion/*release-22.noarch.rpm \
	&& dnf -y install mpv youtube-dl \
	&& dnf clean all

COPY mpv* /usr/share/install/

ENTRYPOINT ["mpv"]
