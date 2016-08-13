FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/tircd:/host/var/lib/tircd:rw \
	-e DATADIR=/var/lib/tircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/tircd:/host/var/lib/tircd:rw \
	-e DATADIR=/var/lib/tircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start tircd@\${NAME}

LABEL STOP /usr/bin/systemctl stop tircd@\${NAME}

RUN ${YUM} -y install \
	perl-Digest-SHA1 \
	perl-HTML-Parser \
	perl-JSON-Any \
	perl-LWP-Protocol-https \
	perl-Net-OAuth \
	perl-Net-Twitter-Lite \
	perl-POE-Filter-IRCD \
	perl-Storable \
	perl-Time-Local \
	perl-URI \
	perl-URI-Find \
	&& ${YUM} clean all

COPY . /

EXPOSE 6667

USER container

VOLUME /data

ENTRYPOINT ["tircd.pl"]
