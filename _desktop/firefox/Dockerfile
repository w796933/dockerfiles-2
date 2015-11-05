FROM quay.io/oszi/base-desktop:fc23

RUN dnf -y install firefox \
	&& dnf clean all

COPY firefox* /usr/share/install/

ENTRYPOINT ["firefox"]
