FROM ${REGISTRY}/${BASE}:${OSREL}

RUN ${YUM} -y install nginx \
	httpd-tools \
	&& ${YUM} clean all \
	&& setcap cap_net_bind_service+ep /usr/sbin/nginx \
	&& chown -R container: /var/*/nginx \
	&& rm -f /etc/nginx/*.default

COPY . /

EXPOSE 80 443

USER container

VOLUME ["/var/lib/nginx", "/tmp"]

CMD ["nginx"]
