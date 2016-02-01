FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=install.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/miniircd:/host/var/lib/miniircd:rw \
	-e DATA=/var/lib/miniircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=uninstall.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/miniircd:/host/var/lib/miniircd:rw \
	-e DATA=/var/lib/miniircd/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start miniircd@\${NAME}

LABEL STOP /usr/bin/systemctl stop miniircd@\${NAME}

RUN useradd -lmd /data --key={UID,GID}_MIN=26658 miniircd

COPY usr /usr

EXPOSE 6667

USER miniircd

VOLUME /data

WORKDIR /usr/src/miniircd

ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
