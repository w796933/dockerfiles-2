FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/systemctl start nginx@\${NAME}" \
	STOP="/usr/bin/systemctl stop nginx@\${NAME}"

RUN ${YUM} -y install nginx \
	httpd-tools \
	&& ${YUM} clean all \
	&& chown -R container: /var/*/nginx \
	&& rm -f /etc/nginx/*.default

COPY . /

EXPOSE 8080 8443

USER container

VOLUME ["/var/lib/nginx", "/tmp"]

CMD ["nginx"]
