FROM ${REGISTRY}/${BASE}:${OSREL}

RUN ${YUM} -y install haproxy \
	&& ${YUM} clean all \
	&& ls /usr/sbin/haproxy* | xargs -n1 setcap cap_net_bind_service+ep \
	&& chown -R container: /var/*/haproxy

COPY . /

EXPOSE 80 443

USER container

VOLUME ["/var/lib/haproxy", "/tmp"]

CMD ["haproxy-systemd-wrapper", "-f", "/etc/haproxy/haproxy.cfg"]
