FROM nightling/base

# Basic desktop prerequisites
COPY include /
RUN dnf -y install redhat-lsb.* {dejavu-{sans,serif},google-cros}*-fonts \
	&& dnf clean all \
	&& useradd -md /data -UG audio,video user

# Common shared libraries
RUN dnf -y install \
	adwaita*.* \
	alsa-plugins-pulseaudio.* \
	gtk{2,3} \
	libicu \
	mesa-dri-drivers.* \
	pulseaudio-libs-glib2.* \
	qtwebkit.* \
	&& dnf clean all

ENV PULSE_SERVER /run/user/pulse/native

VOLUME /data

ENTRYPOINT ["entrypoint"]
