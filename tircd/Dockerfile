FROM quay.io/oszi/fedora:23

RUN dnf -y install perl-JSON-Any perl-LWP-Protocol-https perl-Net-OAuth \
	perl-Net-Twitter-Lite perl-POE-Filter-IRCD perl-URI-Find \
	&& dnf clean all \
	&& useradd -lmd /data --key={UID,GID}_MIN=26180 tircd

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-6667}:6667 --cap-drop=ALL --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

ADD source /opt/tircd
ADD tircd.cfg /opt/tircd/

EXPOSE 6667
USER tircd
VOLUME /data

WORKDIR /opt/tircd
CMD ["perl", "tircd.pl"]
