FROM ${REGISTRY}/${BASE}:${OSREL}

RUN ${YUM} -y install \
	perl-Digest-SHA1 \
	perl-HTML-Parser \
	perl-JSON-Any \
	perl-LWP-Protocol-https \
	perl-Net-OAuth \
	perl-Net-Twitter-Lite \
	perl-POE-Filter-IRCD \
	perl-Storable \
	perl-Time-Local \
	perl-URI \
	perl-URI-Find \
	&& ${YUM} clean all

ENV PERL_LWP_SSL_VERIFY_HOSTNAME=1

COPY . /

EXPOSE 6667

USER container

VOLUME /data

ENTRYPOINT ["tircd.pl"]
