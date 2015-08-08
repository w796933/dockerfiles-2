FROM nightling/buildpack:22
MAINTAINER Nightling

RUN dnf -y install znc-{devel,modpython,modperl} \
	&& dnf clean all \
	&& usermod -md /data znc

ADD modules /usr/share/znc/modules

RUN cd /usr/share/znc/modules/cpp \
	&& znc-buildmod *.cpp

EXPOSE 6667
USER znc
VOLUME /data

ENTRYPOINT ["znc", "--foreground", "--datadir=/data"]
