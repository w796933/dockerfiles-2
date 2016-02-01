FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=install.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/rtorrent:/host/var/lib/rtorrent:rw \
	-e DATA=/var/lib/rtorrent/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=uninstall.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/rtorrent:/host/var/lib/rtorrent:rw \
	-e DATA=/var/lib/rtorrent/\${NAME} \
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

ENV RUTORRENT_DATA=/data/.rutorrent \
	RUTORRENT_TIMEZONE=UTC

COPY . /

RUN ln -sf /etc/rutorrent/config.php /var/www/rutorrent/conf/config.php \
	&& chown -R rtorrent: /data/

VOLUME ["/data", "/tmp"]

WORKDIR /data

EXPOSE 8080

USER rtorrent

CMD ["supervisord"]
