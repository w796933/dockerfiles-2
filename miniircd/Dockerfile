FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-6667}:6667 --cap-drop=ALL --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

RUN useradd -lmd /data --key={UID,GID}_MIN=26658 miniircd

COPY usr /usr

EXPOSE 6667
USER miniircd

VOLUME /data
WORKDIR /usr/src/miniircd

ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
