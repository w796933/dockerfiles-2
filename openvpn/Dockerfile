FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

RUN dnf -y install openvpn bridge-utils \
	&& dnf clean all

ENV EASYRSA=/usr/src/easy-rsa/easyrsa3 \
	EASYRSA_PKI=/etc/openvpn/pki

COPY usr /usr

VOLUME /etc/openvpn
WORKDIR /etc/openvpn

ENTRYPOINT ["entrypoint"]
CMD ["--config", "server.conf"]
