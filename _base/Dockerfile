FROM scratch

LABEL architecture=x86_64 \
	authoritative-source-url=${REGISTRY} \
	vcs-url=https://github.com/oszi/dockerfiles.git

ENV LANG=en_US.UTF-8 \
	LC_COLLATE=POSIX \
	XUSER=${XUSER} \
	XHOME=${XHOME} \
	container=docker

ADD rootfs.${DIST}.tar /
