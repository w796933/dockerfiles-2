FROM quay.io/oszi/base-desktop:fc23

RUN dnf -y install hexchat enchant \
	&& dnf clean all

COPY hexchat* /usr/share/install/

ENTRYPOINT ["hexchat"]
