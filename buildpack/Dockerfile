FROM quay.io/oszi/fedora:22

# SCM and build essentials
RUN dnf -y install \
	autoconf \
	automake \
	binutils \
	bison \
	flex \
	gcc-c++ \
	git \
	mercurial \
	rpm-build \
	rpm-ostree \
	subversion \
	&& dnf clean all

# Common development packages
RUN dnf -y install \
	bzip2-devel \
	expat-devel \
	glib2-devel \
	glibc-devel.* \
	libcurl-devel \
	libevent-devel \
	libffi-devel \
	libicu-devel \
	libstdc++-devel.* \
	libxml2-devel \
	libxslt-devel \
	libyaml-devel \
	openssl-devel \
	perl-devel \
	postgresql-devel \
	python{3,}-devel \
	readline-devel \
	ruby-devel \
	sqlite-devel \
	zlib-devel \
	&& dnf clean all
