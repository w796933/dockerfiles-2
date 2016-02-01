FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run -it --rm --privileged --entrypoint=install.sh \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/openvpn:/host/etc/openvpn:rw \
	-v /etc/openvpn/\${NAME}:/etc/openvpn:rw \
	-v /var/lib/openvpn:/host/var/lib/openvpn:rw \
	-v /var/lib/openvpn/\${NAME}:/var/lib/openvpn:rw \
	-e CONF=/etc/openvpn/\${NAME} \
	-e DATA=/var/lib/openvpn/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=uninstall.sh \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/openvpn:/host/etc/openvpn:rw \
	-v /var/lib/openvpn:/host/var/lib/openvpn:rw \
	-e CONF=/etc/openvpn/\${NAME} \
	-e DATA=/var/lib/openvpn/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start openvpn@\${NAME}

LABEL STOP /usr/bin/systemctl stop openvpn@\${NAME}

RUN dnf -y install openvpn bridge-utils \
	&& dnf clean all \
	&& find /usr -perm /6000 -exec chmod -s '{}' \;

ENV EASYRSA=/usr/share/easy-rsa/easyrsa3 \
	EASYRSA_PKI=/etc/openvpn/pki

COPY usr /usr

VOLUME ["/etc/openvpn", "/var/lib/openvpn"]

WORKDIR /etc/openvpn

ENTRYPOINT ["entrypoint"]
CMD ["--config", "server.conf"]
