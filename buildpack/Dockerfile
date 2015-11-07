FROM quay.io/oszi/fedora:23

# SCM, build essentials and common development packages
RUN dnf -y install \
	autoconf \
	automake \
	bison \
	flex \
	gcc-c++ \
	git \
	mercurial \
	rpm-build \
	rpm-ostree \
	subversion \
	\
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
	postgresql-devel \
	readline-devel \
	sqlite-devel \
	zlib-devel \
	\
	nodejs-devel \
	npm \
	perl-devel \
	perl-CPAN \
	python-devel \
	python-pip \
	python3-devel \
	python3-pip \
	ruby-devel \
	rubygems \
	&& dnf clean all
