FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start \${NAME}" \
	STOP="/usr/bin/systemctl stop \${NAME}"

COPY . /

EXPOSE 6667

USER container

VOLUME /data

ENTRYPOINT ["miniircd", "--state-dir=/data"]
