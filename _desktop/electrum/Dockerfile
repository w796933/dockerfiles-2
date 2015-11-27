FROM oszi/base-desktop:fc23

RUN dnf -y install PyQt4 \
	&& dnf clean all

ENV VERSION 2.5.4

RUN URL=https://download.electrum.org/${VERSION}/Electrum-${VERSION}.tar.gz \
	&& cd /tmp/ \
	&& curl -OL ${URL} \
	&& curl -OL ${URL}.asc \
	&& gpg2 --keyserver ha.pool.sks-keyservers.net --recv-keys 2BD5824B7F9470E6 \
	&& gpg2 --verify Electrum-*.asc Electrum-*.tar.gz \
	&& pip install Electrum-*.tar.gz \
	&& rm -rf ./* ~/.cache

COPY electrum* /usr/share/install/

ENTRYPOINT ["electrum"]
