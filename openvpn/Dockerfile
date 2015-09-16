FROM quay.io/nightling/fedora:22
MAINTAINER Nightling

RUN dnf -y install openvpn bridge-utils \
	&& dnf clean all

COPY easy-rsa /usr/share/easy-rsa
COPY bin /usr/local/bin

ENV EASYRSA=/etc/openvpn/easyrsa3 \
	EASYRSA_PKI=/etc/openvpn/pki

VOLUME /etc/openvpn
WORKDIR /etc/openvpn

CMD ["openvpn.sh", "--config", "server.conf"]
