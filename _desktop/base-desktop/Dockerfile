FROM oszi/fedora:23

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

# Basic apps for convenience
RUN dnf -y install leafpad midori pcmanfm \
	&& dnf clean all \
	&& sed -i -E 's:(text/plain)=(.*):\1=leafpad.desktop:g' \
	/usr/share/applications/mimeapps.list \
	&& sed -i -E 's:(.*(http|html|image).*)=(.*):\1=midori.desktop:g' \
	/usr/share/applications/mimeapps.list \
	&& sed -i -E 's:(.*/directory)=(.*):\1=pcmanfm.desktop:g' \
	/usr/share/applications/mimeapps.list \
	&& ln -sf /usr/bin/midori /etc/alternatives/x-www-browser \
	&& rm -rf /etc/xdg/midori/extensions/adblock/

COPY rootfs /

RUN rsync -a --chmod=ugo=rwX /etc/skel/ /data/ \
	&& install-adblock-filters.sh

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /usr/local:/host/usr/local:rw \
	-v /etc/systemd/user:/host/etc/systemd/user:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /usr/local:/host/usr/local:rw \
	-v /etc/systemd/user:/host/etc/systemd/user:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run --rm --name=\${NAME} \
	--cap-drop=ALL \
	--security-opt=label:disable \
	--net=\${NET:-host} \
	-u \${SUDO_UID:-\$UID}:\${SUDO_GID:-\$GID} \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/localtime:/etc/localtime:ro \
	\$(: \${XDG_RUNTIME_DIR:=/run/user/\$UID}; \
	echo \"-e XDG_RUNTIME_DIR=\${XDG_RUNTIME_DIR}\"; \
	: \${WAYLAND_DISPLAY:=wayland-0}; \
	WAYLAND_SOCK=\${XDG_RUNTIME_DIR}/\${WAYLAND_DISPLAY}; \
	if [ -f \${WAYLAND_SOCK} ]; then \
		echo \"-v \${WAYLAND_SOCK}:\${WAYLAND_SOCK}:ro \
		-e WAYLAND_DISPLAY=\${WAYLAND_DISPLAY}\"; \
	fi) \
	\$(if [ -n "$XAUTHORITY" ]; then \
		echo \"-v \${XAUTHORITY}:\${XAUTHORITY}:ro \
		-e XAUTHORITY=\${XAUTHORITY}\"; \
	fi) \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-e DISPLAY=unix\${DISPLAY:-:0} \
	-e PULSE_SERVER=\${PULSE_SERVER:-localhost} \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \"\${OPTS[@]}\" \${IMAGE}

ENV HOME /data
WORKDIR /data
VOLUME /data
