FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/shadowsocks:/host/etc/shadowsocks:rw \
	-e CONFDIR=/etc/shadowsocks/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/shadowsocks:/host/etc/shadowsocks:rw \
	-e CONFDIR=/etc/shadowsocks/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start shadowsocks@\${NAME}

LABEL STOP /usr/bin/systemctl stop shadowsocks@\${NAME}

RUN ${YUM} -y copr enable librehat/shadowsocks \
	&& ${YUM} -y install shadowsocks-libev \
	&& ${YUM} clean all

COPY . /

USER container

EXPOSE 8388/tcp 8388/udp 1080/tcp 1080/udp

CMD ["ss-server", "-c", "/etc/shadowsocks-libev/config.json", "-u"]
