FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start \${NAME}" \
	STOP="/usr/bin/systemctl stop \${NAME}"

COPY . /

RUN ${YUM} -y install shadowsocks-libev \
	&& ${YUM} clean all

USER container

EXPOSE 8388/tcp 8388/udp 1080/tcp 1080/udp

CMD ["ss-server", "-c", "/etc/shadowsocks-libev/config.json", "-u"]
