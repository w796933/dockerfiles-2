FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
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

VOLUME ["/etc/openvpn", "/var/lib/openvpn", "/tmp"]

WORKDIR /etc/openvpn

ENTRYPOINT ["entrypoint"]

CMD ["--config", "server.conf"]
