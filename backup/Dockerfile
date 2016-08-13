FROM ${REGISTRY}/buildpack:${DIST}

# Expect all packages from the base images...

RUN ${YUM} -y install \
	borgbackup \
	duplicity \
	duply \
	rsnapshot \
	zbackup \
	\
	e2fsprogs-devel \
	pycryptopp \
	python-boto \
	python-keystoneclient \
	python-paramiko \
	python-pexpect \
	python-requests \
	python-requests-oauthlib \
	python-swiftclient \
	python-urllib3 \
	&& ${YUM} clean all

COPY . /

ARG TARSNAP_VERSION=1.0.37

ARG TARSNAP_SIG_KEY=0xbc5cfa093da2bce3

ARG TARSNAP_DOWNLOAD=https://www.tarsnap.com/download

RUN cd /tmp \
	&& curl -sO ${TARSNAP_DOWNLOAD}/tarsnap-autoconf-${TARSNAP_VERSION}.tgz \
	&& curl -sO ${TARSNAP_DOWNLOAD}/tarsnap-sigs-${TARSNAP_VERSION}.asc \
	&& gpg2 --keyserver ha.pool.sks-keyservers.net --recv-keys ${TARSNAP_SIG_KEY} \
	&& gpg2 --decrypt tarsnap-sigs*.asc \
	&& sha256sum -c tarsnap-sigs*.asc \
	&& tar -xzf tarsnap*.tgz \
	&& (cd tarsnap*/ && ./configure && make && make install) \
	&& rm -rf tarsnap* \
	\
	&& cd /usr/src/borgmatic \
	&& python setup.py install \
	&& python setup.py clean --all

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run --rm --name=\${NAME} \
	--net=host --security-opt=label:disable \
	-v /:/host:ro -e HOST=/host \
	-v /etc/group:/etc/group:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /home:/home:ro \
	-v /media:/media:rw \
	-v /run/media:/run/media:rw \
	-v /mnt:/mnt:rw \
	-v /root:/root:rw \
	-i -t -e TERM=\$(tset -q) \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-} \${IMAGE}

VOLUME ["/root", "/var/tmp", "/tmp"]

WORKDIR /root

CMD ["bash", "--norc"]
