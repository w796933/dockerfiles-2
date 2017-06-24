FROM ${REGISTRY}/${BASE}:${OSREL}

COPY . /

RUN BUILD_DEPS=$(echo gcc-c++ redhat-rpm-config {libcurl,libicu,znc}-devel) \
	&& ${YUM} -y install ${BUILD_DEPS} \
		znc \
		znc-modperl \
		znc-modpython \
	&& cd /usr/lib*/znc \
	&& CXXFLAGS='-DUSE_CURL' LIBS='-lcurl' znc-buildmod /usr/src/znc-push/push.cpp \
	&& for MOD in /usr/src/znc-{chanfilter,clientbuffer,modules/*}; do \
		znc-buildmod ${MOD}/*.cpp || exit 1; \
	done \
	&& ${YUM} -y erase ${BUILD_DEPS} \
	&& ${YUM} -y autoremove \
	&& ${YUM} clean all

USER container

VOLUME ["/data", "/tmp"]

ENTRYPOINT ["znc", "-fd", "/data"]
