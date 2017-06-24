FROM ${REGISTRY}/${BASE}:${OSREL}

COPY . /

EXPOSE 6667

USER container

VOLUME /data

ENTRYPOINT ["miniircd", "--state-dir=/data"]
