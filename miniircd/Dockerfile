FROM quay.io/nightling/fedora:22
MAINTAINER Nightling

RUN useradd -lmd /data --key={UID,GID}_MIN=26658 miniircd
ADD source /opt/miniircd

EXPOSE 6667
USER miniircd
VOLUME /data

WORKDIR /opt/miniircd
ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
