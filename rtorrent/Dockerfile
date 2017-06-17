FROM ${REGISTRY}/nginx:${DIST}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start \${NAME}" \
	STOP="/usr/bin/systemctl stop \${NAME}"

ENV RUTORRENT_DATA=/data/.rutorrent \
	RTSESSION=/data/.rtsession \
	PORT_RANGE=55665-55665 \
	DHT_PORT=55666 \
	TIMEZONE=UTC

USER root

RUN ${YUM} -y install \
	rtorrent \
	php-cli \
	php-fpm \
	php-mbstring \
	php-xmlrpc \
	php-pecl-geoip \
	supervisor \
	mediainfo \
	unar \
	unzip \
	&& ${YUM} clean all \
	&& rm -rf /etc/nginx/*.d /artifacts/*

COPY . /

RUN ln -sf /etc/rutorrent/config.php /usr/share/rutorrent/conf/config.php \
	&& sed -i -E 's/^(worker_processes)\s.*/\1 1;/' /etc/nginx/nginx.conf \
	&& chown -R container: /data/

EXPOSE 8080

USER container

VOLUME ["/data", "/tmp", "/var/tmp"]

CMD ["supervisord"]
