FROM ${REGISTRY}/toolbox:${DIST}

# Expect all packages from the base images...

RUN ${YUM} -y install \
	american-fuzzy-lop \
	arptools \
	binwalk \
	dnsenum \
	foremost \
	masscan \
	pcapdiff \
	sslsplit \
	steghide \
	tor \
	valgrind \
	z3 \
	zmap \
	\
	capstone-devel \
	libini_config-devel.* \
	pyserial \
	python-afl \
	python-afl-bin \
	python-mako \
	python-prettytable \
	python-pyelftools \
	python-pygments \
	python-z3 \
	python2-argh \
	python2-dateutil \
	python2-docopt \
	python2-paramiko \
	python2-pysocks \
	python2-requests \
	PyYAML \
	scapy \
	&& ${YUM} clean all

COPY . /

RUN set -e; \
	python -m pip install --upgrade pip; \
	\
	mv -f /usr/bin/checksec /tmp/; \
	for APP in ROPgadget pwntools HashPump xortool; do \
		cd /usr/src/${APP}; \
		python setup.py install; \
		python setup.py clean --all; \
	done; \
	mv -f /tmp/checksec /usr/bin/; \
	\
	cd /usr/src/HashPump; \
	make; \
	make install; \
	make clean; \
	\
	cd /opt/radare2; \
	./sys/install.sh --without-pull; \
	./sys/clean.sh; \
	\
	cd /opt/preeny; \
	make CFLAGS=-m32 && mv *-*-* lib32; \
	make && mv *-*-* lib64; \
	make clean; \
	\
	pip install -r /opt/weevely3/requirements.txt; \
	rm -rf ~/.cache;

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/docker run --rm --name=\${NAME} \
	--net=host --security-opt=label=disable \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v \"\$(pwd):\$(pwd)\" -w \"\$(pwd)\" \
	-i -t -e TERM=xterm-256color \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-} \${IMAGE}"
