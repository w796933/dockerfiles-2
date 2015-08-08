FROM nightling/fedora:22
MAINTAINER Nightling

RUN dnf -y install perl-JSON-Any perl-LWP-Protocol-https perl-Net-OAuth \
	perl-Net-Twitter-Lite perl-POE-Filter-IRCD perl-URI-Find \
	&& dnf clean all \
	&& useradd -rmd /data tircd

ADD source /opt/tircd
ADD tircd.cfg /opt/tircd/

EXPOSE 6667
USER tircd
VOLUME /data

WORKDIR /opt/tircd
CMD ["perl", "tircd.pl"]
