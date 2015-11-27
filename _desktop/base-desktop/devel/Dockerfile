FROM oszi/base-desktop:fc23

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
	readline-devel \
	sqlite-devel \
	zlib-devel \
	\
	perl-devel \
	perl-CPAN \
	python{3,}-devel \
	python{3,}-pip \
	\
	alsa-lib-devel \
	fontconfig-devel \
	freetype-devel \
	gtk{2,3}-devel \
	libwayland-*-devel \
	libX11-devel \
	libXv-devel \
	mesa-lib{wayland*,EGL,GL,GLU}-devel \
	pulseaudio-libs-devel \
	qtwebkit-devel \
	&& dnf clean all
