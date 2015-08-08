FROM nightling/fedora:22
MAINTAINER Nightling

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
	libtool-ltdl-devel \
	libxml2-devel \
	libxslt-devel \
	libyaml-devel \
	lzma-devel \
	openssl-devel \
	perl-devel \
	python{3,}-devel \
	readline-devel \
	ruby-devel \
	sqlite-devel \
	zlib-devel \
	&& dnf clean all
