FROM quay.io/oszi/fedora:22

ADD data /data

RUN curl http://syncapp.bittorrent.com/1.3.109/btsync_x64-1.3.109.tar.gz |\
	tar -xzC /usr/local/bin btsync \
	&& sha1sum -c /data/sha1 \
	&& useradd -d /data btsync && chown btsync: /data

USER btsync
VOLUME ["/data"]

ENTRYPOINT ["btsync", "--nodaemon"]
CMD ["--config", "/data/sync.conf"]
