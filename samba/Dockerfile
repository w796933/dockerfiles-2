FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/samba:/host/etc/samba:rw \
	-v /var/lib/samba:/host/var/lib/samba:rw \
	-e CONFDIR=/etc/samba -e DATADIR=/var/lib/samba \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/samba:/host/etc/samba:rw \
	-v /var/lib/samba:/host/var/lib/samba:rw \
	-e CONFDIR=/etc/samba -e DATADIR=/var/lib/samba \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start smb nmb

LABEL STOP /usr/bin/systemctl stop smb nmb

RUN dnf -y install \
	samba \
	samba-client \
	samba-dc \
	samba-winbind \
	samba-winbind-clients \
	&& dnf clean all

COPY usr /usr

VOLUME ["/var/lib/samba", "/run", "/tmp"]

EXPOSE 137-138/udp 139/tcp 445/tcp

# link to _entrypoint
CMD ["smbd"]
