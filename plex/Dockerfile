FROM docker.io/oszi/fedora:23

ARG USER_ID=32066

ARG VERSION=0.9.15.6.1714-7be11e1

ARG SHA256=0f283dd125589f6b094cd1bd4737172703c7526ae3ea68f72a1cd5657120d3cf

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

RUN useradd -lmd /data --key={UID,GID}_MIN=${USER_ID} plex \
	&& curl -sL ${DOWNLOAD} > /tmp/plex.rpm \
	&& echo ${SHA256} /tmp/plex.rpm | sha256sum -c - \
	&& dnf -y install /tmp/plex.rpm \
	&& dnf clean all && rm -rf /tmp/*

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/data \
	PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver \
	PLEX_MEDIA_SERVER_TMPDIR=/tmp

COPY . /

EXPOSE 32400

USER plex

VOLUME ["/data", "/tmp"]

CMD ["entrypoint"]
