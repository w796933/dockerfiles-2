FROM quay.io/oszi/base-desktop:fc22

ADD etc /etc

RUN dnf -y install google-chrome-stable \
	&& dnf clean all

COPY google-chrome* /usr/share/install/

ENTRYPOINT ["google-chrome"]
