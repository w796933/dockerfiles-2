FROM quay.io/oszi/toolbox:fc23

RUN dnf -y install \
	valgrind \
	american-fuzzy-lop \
	python{3,}-afl \
	python-afl-bin \
	python-z3 \
	z3 \
	\
	libini_config-devel.* \
	pyserial \
	python-argh \
	python-dateutil \
	python-docopt \
	python-mako \
	python-paramiko \
	python-prettytable \
	python-pyelftools \
	python-requests \
	PyYAML \
	scapy \
	&& dnf clean all \
	&& rm -rf /usr/share/install/

COPY opt /opt

RUN set -e; \
	for dir in ROPgadget pwntools HashPump xortool; do \
		cd /opt/$dir; \
		python setup.py install; \
		python setup.py clean --all; \
	done; \
	cd /opt/HashPump; \
	make && make install && make clean; \
	pip install -r /opt/weevely3/requirements.txt; \
	cd /usr/local/bin; \
	ln -s /opt/commix/commix.py commix; \
	ln -s /opt/sqlmap/sqlmap.py sqlmap; \
	ln -s /opt/sqlmap/sqlmapapi.py sqlmapapi; \
	ln -s /opt/weevely3/weevely.py weevely; \
	chmod +x *

LABEL RUN /usr/bin/docker run -it --name=\${NAME} -e NAME=\${NAME} \
	-e IMAGE=\${IMAGE} \${OPT1} \${IMAGE}

COPY include /

VOLUME /root

WORKDIR /root

CMD ["bash"]
