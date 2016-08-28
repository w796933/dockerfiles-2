FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL name=${INAME} version=${DIST} release=${RELEASE} \
	INSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-install -itu root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/limnoria:/host/var/lib/limnoria:rw \
	-v /var/lib/limnoria/\${NAME}:/data:rw \
	-e DATADIR=/var/lib/limnoria/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	UNINSTALL="/usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/limnoria:/host/var/lib/limnoria:rw \
	-e DATADIR=/var/lib/limnoria/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}" \
	RUN="/usr/bin/systemctl start limnoria@\${NAME}" \
	STOP="/usr/bin/systemctl stop limnoria@\${NAME}"

RUN ${YUM} -y install \
	python-babel \
	python-beautifulsoup4 \
	python-chardet \
	python-dateutil \
	python-dictclient \
	python-ecdsa \
	python-feedparser \
	python-gnupg \
	python-lxml \
	python-mock \
	python-oauth2 \
	python-requests \
	python-sqlalchemy \
	python-twitter \
	pytz \
	&& ${YUM} clean all

COPY . /

RUN cd /usr/src/limnoria \
	&& find ../plugins*/ -mindepth 1 -maxdepth 1 -type d -exec ln -s "../{}" plugins/ \; \
	&& python setup.py install \
	&& python setup.py clean --all

USER container

VOLUME /data

WORKDIR /data

ENTRYPOINT ["supybot"]
