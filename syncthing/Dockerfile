FROM quay.io/oszi/fedora:22

RUN API_URL=https://api.github.com/repos/syncthing/syncthing/releases/latest \
	&& cd /tmp \
	&& curl -OL $(curl -s ${API_URL} | egrep -o 'https://[^" ]+-linux-amd64-[^" ]+.tar.gz') \
	&& curl -OL $(curl -s ${API_URL} | egrep -o 'https://[^" ]+/sha256sum.txt.asc') \
	&& gpg2 --keyserver ha.pool.sks-keyservers.net --recv-keys 49F5AEC0BCE524C7 D26E6ED000654A3E \
	&& gpg2 --decrypt sha256sum.txt.asc \
	&& grep linux-amd64 sha256sum.txt.asc | sha256sum -c - \
	&& tar -xzf syncthing-*.tar.gz -C /opt \
	&& ln -s /opt/syncthing-*/syncthing /usr/local/bin/ \
	&& rm -rf ./* /opt/*/*.pdf \
	&& useradd -lmd /data syncthing

ENV HOME /data
WORKDIR /data
VOLUME /data

EXPOSE 8384 22000 21025/udp 21026/udp
USER syncthing

ENTRYPOINT ["syncthing"]
