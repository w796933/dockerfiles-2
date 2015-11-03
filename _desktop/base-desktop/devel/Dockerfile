FROM quay.io/oszi/base-desktop:fc22

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
	subversion \
	waf \
	yasm \
	\
	bzip2-devel \
	expat-devel \
	glib2-devel \
	glibc-devel \
	libcurl-devel \
	libevent-devel \
	libffi-devel \
	libicu-devel \
	libstdc++-devel \
	libxml2-devel \
	libxslt-devel \
	libyaml-devel \
	openssl-devel \
	perl-devel \
	python{3,}-devel \
	readline-devel \
	sqlite-devel \
	zlib-devel \
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
