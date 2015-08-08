FROM nightling/fedora:22
MAINTAINER Nightling

ADD source /opt/miniircd
RUN useradd -rmd /data miniircd

EXPOSE 6667
USER miniircd
VOLUME /data

WORKDIR /opt/miniircd
ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
