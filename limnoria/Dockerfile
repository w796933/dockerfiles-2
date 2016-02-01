FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=install.sh -itu root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/limnoria:/host/var/lib/limnoria:rw \
	-v /var/lib/limnoria/\${NAME}:/data:rw \
	-e DATA=/var/lib/limnoria/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=uninstall.sh -u root \
	-v /etc/systemd/system:/host/etc/systemd/system:rw \
	-v /var/lib/limnoria:/host/var/lib/limnoria:rw \
	-e DATA=/var/lib/limnoria/\${NAME} \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/systemctl start limnoria@\${NAME}

LABEL STOP /usr/bin/systemctl stop limnoria@\${NAME}

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

ENTRYPOINT ["supybot"]
