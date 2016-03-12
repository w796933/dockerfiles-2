FROM docker.io/oszi/fedora:23

# SCM, build essentials and common development packages
RUN dnf -y install \
	autoconf \
	automake \
	bison \
	cmake \
	flex \
	gcc-c++ \
	git \
	mercurial \
	rpm-build \
	rpm-ostree \
	subversion \
	waf \
	yasm \
	\
	bzip2-devel \
	expat-devel \
	file-devel \
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
	libzip-devel \
	openssl-devel \
	postgresql-devel \
	readline-devel \
	sqlite-devel \
	zlib-devel \
	\
	lua-devel \
	nodejs-devel \
	npm \
	perl-devel \
	perl-CPAN \
	python{3,}-devel \
	python{3,}-pip \
	ruby-devel \
	rubygems \
	&& dnf clean all
