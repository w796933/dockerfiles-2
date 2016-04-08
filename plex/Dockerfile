FROM docker.io/oszi/fedora:23

ARG VERSION=0.9.16.4.1911-ee6e505

ARG SHA256=cd5dfcd71f5e5126ea6bd6a079feb92d8df6bee860590f396809b06a3da30053

ARG DOWNLOAD=https://downloads.plex.tv/plex-media-server/\
${VERSION}/plexmediaserver-${VERSION}.x86_64.rpm

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/plex:/host/var/lib/plex:rw \
	-e DATADIR=/var/lib/plex/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/plex:/host/var/lib/plex:rw \
	-e DATADIR=/var/lib/plex/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start plex@\${NAME}

LABEL STOP /usr/bin/systemctl stop plex@\${NAME}

RUN curl -s ${DOWNLOAD} > /tmp/plex.rpm \
	&& echo ${SHA256} /tmp/plex.rpm | sha256sum -c - \
	&& dnf -y install /tmp/plex.rpm \
	&& dnf clean all && rm -rf /tmp/*

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/data \
	PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver \
	PLEX_MEDIA_SERVER_TMPDIR=/tmp \
	PLEX_USER=container

COPY usr /usr

EXPOSE 32400

USER container

VOLUME ["/data", "/tmp"]

CMD ["entrypoint"]
