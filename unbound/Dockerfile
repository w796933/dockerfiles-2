FROM quay.io/oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-53}:53/udp -p \${OPT1:-53}:53/tcp --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

RUN dnf -y install unbound python3-unbound \
	&& dnf clean all \
	&& unbound-control-setup -d /etc/unbound/conf.d

COPY etc /etc
COPY usr /usr

VOLUME ["/var/lib/unbound", "/var/run/unbound"]

EXPOSE 53/udp 53/tcp

CMD ["unbound"]
