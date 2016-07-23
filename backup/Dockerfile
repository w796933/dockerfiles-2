FROM ${REGISTRY}/buildpack:${DIST}

# Expect all packages from the base images...

RUN dnf -y install \
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
	&& dnf clean all

COPY . /

RUN cd /usr/src/borgmatic \
	&& python setup.py install \
	&& python setup.py clean --all \
	\
	&& cd /usr/src/tarsnap \
	&& autoreconf --install \
	&& ./configure \
	&& make \
	&& make install \
	&& make clean

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
