FROM quay.io/oszi/fedora:22

RUN dnf -y install znc znc-mod{perl,python} \
	&& dnf clean all \
	&& (userdel znc || true) \
	&& useradd -lmd /data --key={UID,GID}_MIN=13035 znc

ADD modules /usr/share/znc/modules-external

RUN BASIC_MODS='chanfilter clientbuffer ctcpnotifier highlightattach ignore playback' \
	BUILD_DEPS=$(echo gcc-c++ redhat-rpm-config {libcurl,libicu,znc}-devel) \
	&& dnf -y install $BUILD_DEPS \
	&& cd /usr/share/znc/modules-external \
	&& (cd push; CXXFLAGS='-DUSE_CURL' LIBS='-lcurl' znc-buildmod push.cpp) \
	&& for module in $BASIC_MODS; do \
		(cd "$module"; znc-buildmod "$module".cpp); \
	done \
	&& dnf -y erase $BUILD_DEPS \
	&& dnf -y autoremove \
	&& dnf clean all

EXPOSE 6667
USER znc
VOLUME /data

ENTRYPOINT ["znc", "--foreground", "--datadir=/data"]
