FROM scratch

LABEL name=${BASE} version=${OSREL} release=${RELEASE} \
	architecture=${ARCH} \
	authoritative-source-url=${REGISTRY} \
	distribution-scope=authoritative-source-only \
	vendor="David Osztertag"

ENV LANG=en_US.UTF-8 \
	LC_COLLATE=POSIX \
	XUSER=${XUSER} \
	XHOME=${XHOME} \
	container=docker

ADD rootfs.${DIST}.tar /
