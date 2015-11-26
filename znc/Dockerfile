FROM quay.io/oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -it -p \${OPT1:-7000}:\${OPT1:-7000} --cap-drop=ALL --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE} --makeconf

RUN dnf -y install znc znc-mod{perl,python} \
	&& dnf clean all \
	&& (userdel znc || true) \
	&& useradd -lmd /data --key={UID,GID}_MIN=13035 znc

COPY usr /usr

RUN BUILD_DEPS=$(echo gcc-c++ redhat-rpm-config {libcurl,libicu,znc}-devel) \
	&& dnf -y install $BUILD_DEPS \
	&& cd /usr/share/znc/modules-external \
	&& (cd push; CXXFLAGS='-DUSE_CURL' LIBS='-lcurl' znc-buildmod push.cpp) \
	&& for DIR in $(ls .); do \
		if [ -f ${DIR}/${DIR}.cpp ] && [ ! -f ${DIR}/${DIR}.so ]; then \
			(cd ${DIR}; znc-buildmod ${DIR}.cpp); \
		fi; \
	done \
	&& dnf -y erase $BUILD_DEPS \
	&& dnf -y autoremove \
	&& dnf clean all

USER znc
VOLUME /data

ENTRYPOINT ["znc", "--foreground", "--datadir=/data"]
