FROM docker.io/oszi/nginx:fc23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/rtorrent:/host/var/lib/rtorrent:rw \
	-e DATADIR=/var/lib/rtorrent/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/rtorrent:/host/var/lib/rtorrent:rw \
	-e DATADIR=/var/lib/rtorrent/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start rtorrent@\${NAME}

LABEL STOP /usr/bin/systemctl stop rtorrent@\${NAME}

USER root

RUN dnf -y install rtorrent \
	mediainfo \
	php-cli \
	php-fpm \
	php-pecl-geoip \
	supervisor \
	unar \
	unzip \
	&& dnf clean all \
	&& rm -rf /etc/nginx/*.d /etc/php-fpm* /usr/share/install

COPY . /

RUN ln -sf /etc/rutorrent/config.php /var/www/rutorrent/conf/config.php \
	&& chown -R container: /data/

ENV RUTORRENT_DATA=/data/.rutorrent \
	RTSESSION=/data/.rtsession \
	PORT_RANGE=55665-55665 \
	DHT_PORT=55666

EXPOSE 8080

USER container

VOLUME ["/data", "/tmp", "/var/tmp"]

CMD ["supervisord"]
