FROM quay.io/oszi/base-desktop:fc23-devel

# Dependencies from Fedora
RUN dnf -y install \
	alsa-lib-devel \
	enca-devel \
	fribidi-devel \
	lcms2-devel \
	libarchive-devel \
	libass-devel \
	libbluray-devel \
	libcaca-devel \
	libcdio{-paranoia,}-devel \
	libdvdnav-devel \
	libdvdread-devel \
	libjpeg-turbo-devel \
	libva-devel \
	libvdpau-devel \
	libwayland-*-devel \
	libX11-devel \
	libXScrnSaver-devel \
	libXv-devel \
	lua-devel \
	luajit-devel \
	perl-Math-BigRat \
	pulseaudio-libs-devel \
	rubberband-devel \
	youtube-dl \
	&& dnf clean all

RUN dnf -y install /usr/share/rpmfusion/*release-23.noarch.rpm \
	&& dnf -y install ffmpeg-devel \
	&& dnf clean all

COPY usr /usr

RUN cd /usr/src/mpv \
	&& waf configure --prefix=/usr --enable-libarchive \
	&& waf build -j8 && waf install \
	&& waf distclean

COPY mpv* /usr/share/install/

ENTRYPOINT ["mpv"]
