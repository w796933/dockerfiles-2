FROM scratch

ARG ATOMIC="/usr/bin/docker run -t -i \
	--rm --privileged --user=root --net=host \
	--read-only --tmpfs=/tmp --tmpfs=/var/tmp --tmpfs=/run \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /etc/firewalld/services:/host/etc/firewalld/services:rw \
	-v /etc/profile.d:/host/etc/profile.d:rw \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/containers:/host/etc/containers:rw \
	-v /var/containers:/host/var/containers:rw \
	-e CONFDIR=\${CONFDIR-} -e DATADIR=\${DATADIR-} -e LOGDIR=\${LOGDIR-} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-}"

LABEL Vendor="David Osztertag" \
	Name=${BASE} Version=${OSREL} Release=${RELEASE} \
	INSTALL="${ATOMIC} --entrypoint=atomic-install \${IMAGE}" \
	UNINSTALL="${ATOMIC} --entrypoint=atomic-uninstall \${IMAGE}"

ENV LANG=en_US.UTF-8 \
	LC_COLLATE=POSIX \
	XUSER=${XUSER} \
	XHOME=${XHOME} \
	container=docker

ADD rootfs.${DIST}.tar /
