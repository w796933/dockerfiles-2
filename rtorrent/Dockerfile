FROM oszi/fedora:23

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

RUN dnf -y install rtorrent \
	httpd-tools \
	lighttpd \
	lighttpd-fastcgi \
	php-cli \
	php-fpm \
	php-pecl-geoip \
	mediainfo \
	unzip \
	supervisor \
	&& dnf -y install /usr/share/rpmfusion/*-$(rpm -E %fedora).noarch.rpm \
	&& dnf -y install unrar \
	&& dnf clean all \
	&& useradd -lmd /data --key={UID,GID}_MIN=55665 rtorrent

ENV RUTORRENT_DATA=/data/.rutorrent RTSESSION=/data/.rtsession \
	PORT_RANGE=55665-55665 DHT_PORT=55666

COPY . /

RUN ln -sf /etc/rutorrent/config.php /var/www/rutorrent/conf/config.php \
	&& chown -R rtorrent: /data/

VOLUME ["/data", "/tmp", "/var/tmp"]

WORKDIR /data

EXPOSE 8080

USER rtorrent

CMD ["supervisord"]
