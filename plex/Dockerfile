FROM ${REGISTRY}/${BASE}:${OSREL}

ARG VERSION=1.7.5.4035-313f93718

ARG SHA256=89b8585e561046a8422d520ebcdae784f5dc3c895aac8d313c435cc6b58795b8

ARG DOWNLOAD=https://downloads.plex.tv/plex-media-server/\
${VERSION}/plexmediaserver-${VERSION}.${ARCH}.rpm

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start \${NAME}" \
	STOP="/usr/bin/systemctl stop \${NAME}"

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/data \
	PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver \
	PLEX_MEDIA_SERVER_TMPDIR=/tmp

RUN curl -s ${DOWNLOAD} > /tmp/plex.rpm \
	&& echo ${SHA256} /tmp/plex.rpm | sha256sum -c - \
	&& ${YUM} -y install /tmp/plex.rpm \
	&& ${YUM} clean all && rm -rf /tmp/*

COPY . /

EXPOSE 32400

USER container

VOLUME ["/data", "/tmp"]

CMD ["entrypoint"]
