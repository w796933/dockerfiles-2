FROM nightling/buildpack:22
MAINTAINER Nightling

RUN dnf -y install \
	binwalk \
	checksec \
	gdb \
	hexedit \
	ltrace \
	strace \
	valgrind \
	vim-enhanced \
	\
	american-fuzzy-lop \
	python{3,}-afl \
	python-afl-bin \
	z3 \
	\
	libini_config-devel.* \
	pyserial \
	python-argh \
	python-mako \
	python-paramiko \
	python-pyelftools \
	python-requests \
	\
	&& dnf clean all

COPY ROPgadget /opt/ROPgadget
RUN cd /opt/ROPgadget \
	&& python setup.py install \
	&& rm -rf build ~/.cache

COPY pwntools /opt/pwntools
RUN cd /opt/pwntools \
	&& python setup.py install \
	&& rm -rf build ~/.cache

COPY preeny /opt/preeny
RUN cd /opt/preeny \
	&& make -C src && mv *-*-* bin64 \
	&& PLATFORM=-m32 setarch i686 make -C src && mv *-*-* bin32

COPY peda /opt/peda

COPY root /root
VOLUME /root
WORKDIR /root

EXPOSE 1337 1337/udp

CMD ["bash"]
