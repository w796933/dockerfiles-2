FROM ${REGISTRY}/${BASE}:${OSREL}

ARG VERSION=1.5.5.3634-995f1dead

ARG SHA256=309167f3235f740871c52494e1e6bf7a5d447f878aece59e40c55592cffe627e

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
