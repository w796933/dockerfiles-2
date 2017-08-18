FROM ${REGISTRY}/${BASE}:${OSREL}

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/data \
	PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver \
	PLEX_MEDIA_SERVER_TMPDIR=/tmp

RUN curl -sL ${PLEX_RPM} > /tmp/plex.rpm \
	&& echo ${PLEX_SHA256} /tmp/plex.rpm | sha256sum -c - \
	&& ${YUM} -y install /tmp/plex.rpm \
	&& ${YUM} clean all && rm -rf /tmp/*

COPY . /

EXPOSE 32400

USER container

VOLUME ["/data", "/tmp"]

CMD ["entrypoint"]
