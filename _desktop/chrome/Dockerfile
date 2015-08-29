FROM nightling/base-gui:22
MAINTAINER Nightling

ADD etc /etc

RUN dnf -y install google-chrome-stable \
	&& dnf clean all

ENTRYPOINT ["google-chrome"]
CMD ["--incognito"]
