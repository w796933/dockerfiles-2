FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
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
