FROM ${REGISTRY}/${BASE}:${OSREL}

# SCM, build essentials and common development packages
RUN ${YUM} -y install \
	autoconf \
	automake \
	bison \
	cmake \
	flex \
	gcc-c++ \
	git \
	inotify-tools \
	mercurial \
	rpm-build \
	rpm-ostree \
	rpmdevtools \
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
	perl-devel \
	perl-CPAN \
	python{3,}-devel \
	python{3,}-pip \
	ruby-devel \
	rubygems \
	&& ${YUM} clean all

LABEL name=${INAME} version=${DIST} release=${RELEASE}
