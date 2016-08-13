FROM ${REGISTRY}/${BASE}:${OSREL}

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install -itu root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/znc:/host/var/lib/znc:rw \
	-v /var/lib/znc/\${NAME}:/data:rw \
	-e DATADIR=/var/lib/znc/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall -u root \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/znc:/host/var/lib/znc:rw \
	-e DATADIR=/var/lib/znc/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start znc@\${NAME}

LABEL STOP /usr/bin/systemctl stop znc@\${NAME}

RUN ${YUM} -y install znc znc-mod{perl,python} \
	&& ${YUM} clean all

COPY . /

RUN BUILD_DEPS=$(echo gcc-c++ redhat-rpm-config {libcurl,libicu,znc}-devel) \
	&& ${YUM} -y install $BUILD_DEPS \
	&& cd /usr/lib*/znc \
	&& CXXFLAGS='-DUSE_CURL' LIBS='-lcurl' znc-buildmod /usr/src/znc/modules/push/push.cpp \
	&& for NAME in $(ls /usr/src/znc/modules); do \
		DIR=/usr/src/znc/modules/${NAME}; \
		if [ -f ${DIR}/${NAME}.cpp ] && [ ! -f ${NAME}.so ]; then \
			znc-buildmod ${DIR}/${NAME}.cpp || exit 1; \
		fi; \
	done \
	&& ${YUM} -y erase $BUILD_DEPS \
	&& ${YUM} -y autoremove \
	&& ${YUM} clean all

USER container

VOLUME ["/data", "/tmp"]

ENTRYPOINT ["znc", "-fd", "/data"]
