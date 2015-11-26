FROM quay.io/oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

RUN dnf -y install \
	python-babel \
	python-beautifulsoup4 \
	python-chardet \
	python-dateutil \
	python-dictclient \
	python-ecdsa \
	python-feedparser \
	python-gnupg \
	python-lxml \
	python-mock \
	python-oauth2 \
	python-requests \
	python-sqlalchemy \
	python-twitter \
	pytz \
	&& dnf clean all

COPY usr /usr

RUN cd /usr/src/limnoria \
	&& pip install -r requirements.txt \
	&& (cd plugins && find ../../plugins*/ -mindepth 1 -maxdepth 1 -type d -exec ln -s "{}" \;) \
	&& python setup.py install \
	&& rm -rf build ~/.cache \
	&& useradd -lmd /data --key={UID,GID}_MIN=13296 limnoria

USER limnoria
VOLUME /data
WORKDIR /data

CMD ["supybot", "--help"]
