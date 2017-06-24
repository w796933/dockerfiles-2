FROM scratch

ARG ATOMIC="/usr/bin/docker run -t -i --rm --name=\${NAME} \
	--user=root --network=host --security-opt=label=disable \
	--read-only --tmpfs=/tmp --tmpfs=/var/tmp \
	-v /etc:/host/etc:rw -v /opt:/host/opt:rw -v /var:/host/var:rw \
	-v /dev:/host/dev:ro -v /run:/host/run:ro -v /usr:/host/usr:ro \
	-e CONFDIR=\${CONFDIR} -e DATADIR=\${DATADIR} -e LOGDIR=\${LOGDIR} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE}"

LABEL Vendor="David Osztertag <root@oszi.one>" \
	INSTALL="${ATOMIC} --entrypoint=atomic-install \${IMAGE}" \
	UNINSTALL="${ATOMIC} --entrypoint=atomic-uninstall \${IMAGE}"

ENV LANG=en_US.UTF-8 LC_COLLATE=POSIX

ADD rootfs.${DIST}.tar /
