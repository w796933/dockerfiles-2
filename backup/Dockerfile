FROM ${REGISTRY}/buildpack:${DIST}

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

RUN cd /usr/src/borgmatic \
	&& python setup.py install \
	&& python setup.py clean --all \
	\
	&& cd /usr/src/tarsnap \
	&& autoreconf -i \
	&& ./configure \
	&& make \
	&& make install \
	&& make clean

LABEL RUN="/usr/bin/docker run --rm --name=\${NAME} \
	--network=host --security-opt=label=disable \
	-v /:/host:ro -e HOST=/host \
	-v /etc/group:/etc/group:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /home:/home:rw \
	-v /media:/media:rw \
	-v /mnt:/mnt:rw \
	-v /run:/run:rw \
	-v /root/.cache:/root/.cache:rw \
	-v /root/.config:/root/.config:rw \
	-v /root/.local:/root/.local:rw \
	-v /root/.gnupg:/root/.gnupg:rw \
	-v /root/.ssh:/root/.ssh:rw \
	-v /var/tmp:/var/tmp:rw \
	-v /tmp:/tmp:rw \
	-i -t -e TERM=xterm-256color \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS} \${IMAGE}"

VOLUME ["/var/tmp", "/tmp"]

WORKDIR /host

CMD ["bash"]
