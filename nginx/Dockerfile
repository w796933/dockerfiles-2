FROM ${REPO}/${BASE}:${RELEASE}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/nginx:/host/etc/nginx:rw \
	-v /var/www:/host/var/www:rw \
	-e CONFDIR=/etc/nginx/\${NAME} \
	-e DATADIR=/var/www/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/nginx:/host/etc/nginx:rw \
	-v /var/www:/host/var/www:rw \
	-e CONFDIR=/etc/nginx/\${NAME} \
	-e DATADIR=/var/www/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start nginx@\${NAME}

LABEL STOP /usr/bin/systemctl stop nginx@\${NAME}

RUN dnf -y install nginx \
	httpd-tools \
	&& dnf clean all \
	&& chown -R container: /var/*/nginx \
	&& rm -f /etc/nginx/*.default

COPY . /

EXPOSE 8080 8443

USER container

VOLUME ["/var/lib/nginx", "/tmp"]

CMD ["nginx"]
