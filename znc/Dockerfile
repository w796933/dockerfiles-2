FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=install.sh -itu root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/znc:/host/var/lib/znc:rw \
	-v /var/lib/znc/\${NAME}:/data:rw \
	-e DATA=/var/lib/znc/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=uninstall.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/znc:/host/var/lib/znc:rw \
	-e DATA=/var/lib/znc/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start znc@\${NAME}

LABEL STOP /usr/bin/systemctl stop znc@\${NAME}

RUN dnf -y install znc znc-mod{perl,python} \
	&& dnf clean all \
	&& (userdel znc || true) \
	&& useradd -lmd /data --key={UID,GID}_MIN=13035 znc

COPY usr /usr

RUN BUILD_DEPS=$(echo gcc-c++ redhat-rpm-config {libcurl,libicu,znc}-devel) \
	&& dnf -y install $BUILD_DEPS \
	&& cd /usr/lib*/znc \
	&& CXXFLAGS='-DUSE_CURL' LIBS='-lcurl' znc-buildmod /usr/src/znc/modules/push/push.cpp \
	&& for NAME in $(ls /usr/src/znc/modules); do \
		DIR=/usr/src/znc/modules/${NAME}; \
		if [ -f ${DIR}/${NAME}.cpp ] && [ ! -f ${NAME}.so ]; then \
			znc-buildmod ${DIR}/${NAME}.cpp || exit 1; \
		fi; \
	done \
	&& dnf -y erase $BUILD_DEPS \
	&& dnf -y autoremove \
	&& dnf clean all

USER znc
VOLUME /data
WORKDIR /data

ENTRYPOINT ["znc", "--foreground", "--datadir=/data"]
