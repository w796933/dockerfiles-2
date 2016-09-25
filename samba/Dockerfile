FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL name=${INAME} version=${DIST} release=${RELEASE} \
	INSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/samba:/host/etc/samba:rw \
	-v /var/lib/samba:/host/var/lib/samba:rw \
	-e CONFDIR=/etc/samba -e DATADIR=/var/lib/samba \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	UNINSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/samba:/host/etc/samba:rw \
	-v /var/lib/samba:/host/var/lib/samba:rw \
	-e CONFDIR=/etc/samba -e DATADIR=/var/lib/samba \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	RUN="/usr/bin/systemctl start smb nmb" \
	STOP="/usr/bin/systemctl stop smb nmb"

RUN ${YUM} -y install \
	samba \
	samba-client \
	samba-dc \
	samba-winbind \
	samba-winbind-clients \
	&& ${YUM} clean all

COPY . /

VOLUME ["/var/lib/samba", "/var/log/samba", "/run", "/tmp"]

EXPOSE 137-138/udp 139/tcp 445/tcp

# Link to _entrypoint
CMD ["smbd"]
