FROM ${REGISTRY}/${BASE}:${OSREL}

COPY . /

RUN ${YUM} -y install shadowsocks-libev \
	&& ${YUM} clean all \
	&& ls /usr/bin/ss-* | xargs -n1 setcap cap_net_bind_service+ep

USER container

EXPOSE 8388/tcp 8388/udp 1080/tcp 1080/udp

CMD ["ss-server", "-c", "/etc/shadowsocks-libev/config.json"]
