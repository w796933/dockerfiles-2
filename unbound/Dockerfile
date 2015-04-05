FROM nightling/base

RUN dnf -y install unbound python3-unbound \
	&& dnf clean all \
	&& unbound-control-setup -d /etc/unbound/conf.d

ADD etc /etc

EXPOSE 53/udp
EXPOSE 53

CMD ["unbound"]
