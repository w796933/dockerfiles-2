FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/haproxy:/host/etc/haproxy:rw \
	-e CONFDIR=/etc/haproxy/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/haproxy:/host/etc/haproxy:rw \
	-e CONFDIR=/etc/haproxy/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start haproxy@\${NAME}

LABEL STOP /usr/bin/systemctl stop haproxy@\${NAME}

RUN ${YUM} -y install haproxy \
	&& ${YUM} clean all \
	&& chown -R container: /var/*/haproxy

COPY . /

USER container

VOLUME ["/var/lib/haproxy", "/tmp"]

CMD ["haproxy-systemd-wrapper", "-f", "/etc/haproxy/haproxy.cfg"]
