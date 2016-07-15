FROM ${REGISTRY}/toolbox:${DIST}

# Expect all packages from the base images...

RUN dnf -y install \
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
	python*-afl \
	python-afl-bin \
	python-argh \
	python-dateutil \
	python-docopt \
	python-mako \
	python-paramiko \
	python-prettytable \
	python-pyelftools \
	python2-requests \
	python-z3 \
	PyYAML \
	scapy \
	&& dnf clean all \
	&& rm -rf /artifacts/*/

COPY . /

RUN set -e; \
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

LABEL RUN /usr/bin/docker run -it --rm --name=\${NAME} \
	--net=host --security-opt=label:disable \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v \"\$(pwd):\$(pwd)\" -w \"\$(pwd)\" \
	-e TERM=\$(tset -q) -e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-} \${IMAGE}
