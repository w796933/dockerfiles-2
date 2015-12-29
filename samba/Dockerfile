FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -d \${OPT1} --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

RUN dnf -y install \
	samba \
	samba-client \
	samba-dc \
	samba-winbind \
	samba-winbind-clients \
	&& dnf clean all

COPY . /

VOLUME ["/var/lib/samba", "/run", "/tmp"]

EXPOSE 137-138/udp 139/tcp 445/tcp

# link to _entrypoint
CMD ["smbd"]
