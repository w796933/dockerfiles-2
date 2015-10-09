FROM quay.io/oszi/fedora:22

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

RUN rsync -a --chmod=ugo=rwX /etc/skel/ /data/

ENV HOME /data
WORKDIR /data
VOLUME /data
