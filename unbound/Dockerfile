FROM quay.io/oszi/fedora:23

RUN dnf -y install unbound python3-unbound \
	&& dnf clean all \
	&& unbound-control-setup -d /etc/unbound/conf.d

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-53}:53/udp -p \${OPT1:-53}:53/tcp --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

ADD etc /etc

VOLUME ["/var/lib/unbound", "/var/run/unbound"]

EXPOSE 53/udp 53/tcp

CMD ["unbound"]
