FROM oszi/toolbox:fc23

RUN dnf -y install \
	american-fuzzy-lop \
	steghide \
	valgrind \
	z3 \
	\
	libini_config-devel.* \
	pyserial \
	python{3,}-afl \
	python-afl-bin \
	python-argh \
	python-dateutil \
	python-docopt \
	python-mako \
	python-paramiko \
	python-prettytable \
	python-pyelftools \
	python-requests \
	python-z3 \
	PyYAML \
	scapy \
	&& dnf clean all \
	&& rm -rf /usr/share/install/

COPY rootfs /

RUN set -e; \
	for dir in ROPgadget pwntools HashPump xortool; do \
		cd /opt/$dir; \
		python setup.py install; \
		python setup.py clean --all; \
	done; \
	cd /opt/HashPump; \
	make; \
	make install; \
	make clean; \
	cd /opt/preeny; \
	make; \
	mv *-*-* bin64; \
	CFLAGS=-m32 setarch i686 make; \
	mv *-*-* bin32; \
	make clean; \
	pip install -r /opt/weevely3/requirements.txt; \
	cd /usr/bin; \
	ln -s /opt/commix/commix.py commix; \
	ln -s /opt/sqlmap/sqlmap.py sqlmap; \
	ln -s /opt/sqlmap/sqlmapapi.py sqlmapapi; \
	ln -s /opt/weevely3/weevely.py weevely; \
	chmod +x *

LABEL RUN /usr/bin/docker run -it --rm --net=host --name=\${NAME} \
	--security-opt=label:disable \
	-v /etc/environment:/etc/environment:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v \"\$(pwd):\$(pwd)\" -w \"\$(pwd)\" \
	-e TERM=\$(tset -q) \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \${OPT1} \${IMAGE}
