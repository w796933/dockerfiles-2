FROM quay.io/oszi/fedora:23

ENV VERSION v0.12.4

RUN URL=https://github.com/syncthing/syncthing/releases/download/${VERSION} \
	&& cd /tmp/ \
	&& curl -OL ${URL}/syncthing-linux-amd64-${VERSION}.tar.gz \
	&& curl -OL ${URL}/sha256sum.txt.asc \
	&& gpg2 --keyserver ha.pool.sks-keyservers.net --recv-keys D26E6ED000654A3E \
	&& gpg2 --decrypt sha256sum.txt.asc \
	&& grep linux-amd64 sha256sum.txt.asc | sha256sum -c - \
	&& tar -xzf syncthing-*.tar.gz -C /opt \
	&& ln -s /opt/syncthing-*/syncthing /usr/bin/ \
	&& rm -rf ./* /opt/*/*.pdf \
	&& useradd -lmd /data syncthing

ENV HOME /data
WORKDIR /data
VOLUME /data

EXPOSE 8384 22000 21025/udp 21026/udp
USER syncthing

ENTRYPOINT ["syncthing"]
