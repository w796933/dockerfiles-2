FROM quay.io/oszi/fedora:23

RUN dnf -y install openvpn bridge-utils \
	&& dnf clean all

COPY easy-rsa /usr/share/easy-rsa
COPY bin /usr/local/bin

ENV EASYRSA=/usr/share/easy-rsa/easyrsa3 \
	EASYRSA_PKI=/etc/openvpn/pki

VOLUME /etc/openvpn
WORKDIR /etc/openvpn

ENTRYPOINT ["entrypoint"]
CMD ["--config", "server.conf"]
