FROM docker.io/oszi/fedora:23

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
	irssi \
	lighttpd \
	lighttpd-fastcgi \
	mediainfo \
	perl-Archive-Zip \
	perl-Digest-SHA \
	perl-HTML-Parser \
	perl-JSON \
	perl-JSON-XS \
	perl-Net-SSLeay \
	perl-XML-LibXML \
	php-cli \
	php-fpm \
	php-pecl-geoip \
	supervisor \
	unzip \
	&& dnf -y install /usr/share/rpmfusion/*-$(rpm -E %fedora).noarch.rpm \
	&& dnf -y install unrar \
	&& dnf clean all \
	&& useradd -lmd /data --key={UID,GID}_MIN=55665 rtorrent

COPY . /

RUN cd /var/www/rutorrent \
	&& cp -sa /usr/share/autodl-rutorrent plugins/autodl-irssi \
	&& ln -sf /etc/rutorrent/autodl.php plugins/autodl-irssi/conf.php \
	&& ln -sf /etc/rutorrent/config.php conf/config.php \
	&& chown -R rtorrent: /data/

ENV RUTORRENT_DATA=/data/.rutorrent RTSESSION=/data/.rtsession \
	PORT_RANGE=55665-55665 DHT_PORT=55666

VOLUME ["/data", "/tmp", "/var/tmp"]

WORKDIR /data

EXPOSE 8080

USER rtorrent

CMD ["supervisord"]
