FROM ${REGISTRY}/${BASE}:${OSREL}

ENV PATH=${PATH}:/usr/share/gocode/bin \
	GOPATH=/usr/share/gocode

# SCM, build essentials and common devel packages
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
	golang \
	lua-devel \
	perl-devel \
	perl-CPAN \
	python{3,}-devel \
	python{3,}-pip \
	ruby-devel \
	rubygems \
	&& ${YUM} clean all
