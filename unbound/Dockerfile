FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/unbound:/host/etc/unbound:rw \
	-v /var/lib/unbound:/host/var/lib/unbound:rw \
	-e CONFDIR=/etc/unbound -e DATADIR=/var/lib/unbound \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/unbound:/host/etc/unbound:rw \
	-v /var/lib/unbound:/host/var/lib/unbound:rw \
	-e CONFDIR=/etc/unbound -e DATADIR=/var/lib/unbound \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start unbound

LABEL STOP /usr/bin/systemctl stop unbound

RUN dnf -y install unbound python3-unbound \
	&& dnf clean all \
	&& unbound-control-setup \
	&& find /usr -perm /6000 -exec chmod -s '{}' \;

COPY . /

VOLUME ["/var/lib/unbound", "/var/run/unbound"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["unbound", "-d"]
