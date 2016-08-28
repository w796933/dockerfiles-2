FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL name=${INAME} version=${DIST} release=${RELEASE} \
	INSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/unbound:/host/etc/unbound:rw \
	-v /var/lib/unbound:/host/var/lib/unbound:rw \
	-e CONFDIR=/etc/unbound -e DATADIR=/var/lib/unbound \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	UNINSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/unbound:/host/etc/unbound:rw \
	-v /var/lib/unbound:/host/var/lib/unbound:rw \
	-e CONFDIR=/etc/unbound -e DATADIR=/var/lib/unbound \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	RUN="/usr/bin/systemctl start unbound" \
	STOP="/usr/bin/systemctl stop unbound"

RUN ${YUM} -y install unbound python*-unbound \
	&& ${YUM} clean all \
	&& unbound-control-setup \
	&& usermod -a -G unbound container \
	&& chmod -R g=u /var/*/unbound \
	&& find /usr -perm /6000 -exec chmod -s '{}' \;

COPY . /

VOLUME ["/var/lib/unbound", "/var/run/unbound"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["unbound", "-d"]
