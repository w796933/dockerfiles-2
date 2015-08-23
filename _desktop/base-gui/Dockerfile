FROM nightling/fedora:22
MAINTAINER Nightling

# Common shared libraries
RUN dnf -y install \
	{dejavu-{sans,serif},google-cros}*-fonts \
	adwaita*.* \
	alsa-plugins-pulseaudio.* \
	gtk{2,3} \
	mesa-dri-drivers.* \
	pulseaudio-libs{-glib2,}.* \
	qtwebkit \
	redhat-lsb.* \
	xorg-x11-server-utils \
	&& dnf clean all

COPY include /

RUN useradd -lmd /data -UG audio,video user

ENV PULSE_SERVER /run/user/pulse/native

VOLUME /data

ENTRYPOINT ["entrypoint"]
