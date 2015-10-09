FROM quay.io/oszi/fedora:22

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

# Omitted from plugins: pygraphviz django

COPY source /opt/limnoria
COPY plugins-progval /opt/limnoria/plugins
COPY plugins-glolol /opt/limnoria/plugins
COPY plugins-extra /opt/limnoria/plugins

RUN cd /opt/limnoria \
	&& pip install -r requirements.txt \
	&& python setup.py install \
	&& rm -rf build ~/.cache \
	&& useradd -lmd /data --key={UID,GID}_MIN=13296 limnoria

USER limnoria
VOLUME /data
WORKDIR /data

CMD ["supybot", "--help"]
