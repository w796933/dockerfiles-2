FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start haproxy@\${NAME}" \
	STOP="/usr/bin/systemctl stop haproxy@\${NAME}"

RUN ${YUM} -y install haproxy \
	&& ${YUM} clean all \
	&& chown -R container: /var/*/haproxy

COPY . /

USER container

VOLUME ["/var/lib/haproxy", "/tmp"]

CMD ["haproxy-systemd-wrapper", "-f", "/etc/haproxy/haproxy.cfg"]
