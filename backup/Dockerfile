FROM quay.io/oszi/buildpack:fc22

RUN dnf -y install \
	duplicity \
	rsnapshot \
	e2fsprogs-devel \
	&& dnf clean all

RUN TARSNAP_VERSION=1.0.36.1 \
	&& cd /tmp \
	&& curl -O https://www.tarsnap.com/download/tarsnap-autoconf-${TARSNAP_VERSION}.tgz \
	&& curl -O https://www.tarsnap.com/download/tarsnap-sigs-${TARSNAP_VERSION}.asc \
	&& gpg2 --keyserver ha.pool.sks-keyservers.net --recv-keys 46B64BEB \
	&& gpg2 --decrypt tarsnap-sigs-*.asc \
	&& sha256sum -c tarsnap-sigs-*.asc \
	&& tar -xzf tarsnap-*.tgz \
	&& (cd tarsnap-*/ && ./configure && make && make install) \
	&& rm -rf ./*
