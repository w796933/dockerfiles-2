FROM ${REGISTRY}/${BASE}:${OSREL}

RUN ${YUM} -y install unbound python*-unbound \
	&& ${YUM} clean all \
	&& unbound-control-setup \
	&& usermod -a -G unbound container \
	&& chmod -R g=u /var/*/unbound \
	&& find /usr -perm /6000 -exec chmod -s '{}' \;

COPY . /

VOLUME ["/var/lib/unbound", "/var/run/unbound", "/tmp"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["unbound", "-d"]
