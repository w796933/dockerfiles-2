FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/miniircd:/host/var/lib/miniircd:rw \
	-e DATADIR=/var/lib/miniircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/miniircd:/host/var/lib/miniircd:rw \
	-e DATADIR=/var/lib/miniircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start miniircd@\${NAME}

LABEL STOP /usr/bin/systemctl stop miniircd@\${NAME}

COPY usr /usr

EXPOSE 6667

USER container

VOLUME /data

ENTRYPOINT ["miniircd", "--statedir=/data"]
