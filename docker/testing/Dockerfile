FROM nightling/base

RUN dnf -y --enablerepo=updates-testing install docker lxc \
	&& dnf clean all

COPY wrapdocker /usr/local/bin/

VOLUME /var/lib/docker

CMD ["wrapdocker"]
