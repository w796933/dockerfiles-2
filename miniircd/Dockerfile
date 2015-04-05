FROM nightling/base

ADD source /opt/miniircd
RUN useradd -rmd /data miniircd

EXPOSE 6667
USER miniircd
VOLUME /data

WORKDIR /opt/miniircd
ENTRYPOINT ["python", "miniircd"]
CMD ["--statedir=/data"]
