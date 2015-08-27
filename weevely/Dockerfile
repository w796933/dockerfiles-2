FROM nightling/fedora:22
MAINTAINER Nightling

RUN dnf -y install python-{dateutil,mako,prettytable} PyYAML \
	&& dnf clean all

COPY source /opt/weevely3

RUN ln -s /opt/weevely3/weevely.py /usr/bin/weevely \
	&& pip install -r /opt/weevely3/requirements.txt \
	&& rm -rf ~/.cache \
	&& useradd -lmd /data weevely

USER weevely

VOLUME /data
WORKDIR /data

ENTRYPOINT ["weevely"]
