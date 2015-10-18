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

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker create --name=\${NAME} -u \${UID}:\${GID} \
	--cap-drop=ALL --security-opt=label:disable \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /run/user/\${UID}/pulse:/run/user/\${UID}/pulse:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-e DISPLAY=\${DISPLAY:-:0} \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \${OPT1} \${IMAGE}; \
	/usr/bin/docker start \${NAME}

COPY include /

RUN rsync -a --chmod=ugo=rwX /etc/skel/ /data/

ENV HOME /data
WORKDIR /data
VOLUME /data
