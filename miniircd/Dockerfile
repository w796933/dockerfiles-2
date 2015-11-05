FROM quay.io/oszi/fedora:23

RUN useradd -lmd /data --key={UID,GID}_MIN=26658 miniircd
ADD source /opt/miniircd

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-6667}:6667 --cap-drop=ALL --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

EXPOSE 6667
USER miniircd
VOLUME /data

WORKDIR /opt/miniircd
ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
