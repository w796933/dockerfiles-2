FROM ${REGISTRY}/${BASE}:${OSREL}

RUN ${YUM} -y install \
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
	&& ${YUM} clean all

COPY . /

RUN cd /usr/src/limnoria \
	&& find ../plugins*/ -mindepth 1 -maxdepth 1 -type d -exec ln -s "../{}" plugins/ \; \
	&& python setup.py install \
	&& python setup.py clean --all

USER container

VOLUME /data

WORKDIR /data

ENTRYPOINT ["supybot"]
