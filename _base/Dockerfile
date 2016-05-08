FROM scratch
MAINTAINER David Osztertag <devel@oszi.one>

LABEL VCS-URL=https://github.com/oszi/dockerfiles.git \
	AUTHORITATIVE-SOURCE=${REGISTRY} \
	ARCHITECTURE=x86_64

ENV LANG=en_US.UTF-8 LC_COLLATE=POSIX \
	XUSER=${XUSER} XHOME=${XHOME}

ADD rootfs.${DIST}.tar /
