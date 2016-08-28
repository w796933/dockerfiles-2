FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL name=${INAME} version=${DIST} release=${RELEASE} \
	INSTALL="/usr/bin/docker run -it --rm --privileged --entrypoint=atomic-install \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/openvpn:/host/etc/openvpn:rw \
	-v /etc/openvpn/\${NAME}:/etc/openvpn:rw \
	-v /var/lib/openvpn:/host/var/lib/openvpn:rw \
	-v /var/lib/openvpn/\${NAME}:/var/lib/openvpn:rw \
	-e CONFDIR=/etc/openvpn/\${NAME} \
	-e DATADIR=/var/lib/openvpn/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	UNINSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/openvpn:/host/etc/openvpn:rw \
	-v /var/lib/openvpn:/host/var/lib/openvpn:rw \
	-e CONFDIR=/etc/openvpn/\${NAME} \
	-e DATADIR=/var/lib/openvpn/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	RUN="/usr/bin/systemctl start openvpn@\${NAME}" \
	STOP="/usr/bin/systemctl stop openvpn@\${NAME}"

RUN ${YUM} -y install openvpn \
	bridge-utils \
	iproute \
	iptables \
	&& ${YUM} clean all \
	&& find /usr -perm /6000 -exec chmod -s '{}' \;

COPY . /

ENV EASYRSA=/usr/share/easy-rsa/easyrsa3 \
	EASYRSA_PKI=/etc/openvpn/pki

VOLUME ["/etc/openvpn", "/var/lib/openvpn"]

WORKDIR /etc/openvpn

ENTRYPOINT ["entrypoint"]

CMD ["--config", "server.conf"]
