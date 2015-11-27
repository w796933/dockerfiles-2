FROM oszi/fedora:23

LABEL INSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged -u root \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -d -p \${OPT1:-6667}:6667 --cap-drop=ALL --read-only \
	--name=\${NAME} -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

RUN dnf -y install \
	perl-JSON-Any \
	perl-LWP-Protocol-https \
	perl-Net-OAuth \
	perl-Net-Twitter-Lite \
	perl-POE-Filter-IRCD \
	perl-URI-Find \
	&& dnf clean all \
	&& useradd -lmd /data --key={UID,GID}_MIN=26180 tircd

COPY usr /usr
ADD tircd.cfg /usr/src/tircd/

EXPOSE 6667
USER tircd

VOLUME /data
WORKDIR /usr/src/tircd

ENTRYPOINT ["perl", "tircd.pl"]
