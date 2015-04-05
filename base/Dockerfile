FROM fedora:22
MAINTAINER Nightling

RUN dnf -y upgrade && dnf -y install \
	bind-utils \
	bzip2 \
	dnf-plugins-core \
	file \
	findutils \
	git \
	gnupg2 \
	hostname \
	iproute \
	iputils \
	less \
	make \
	nmap-ncat \
	openssh-clients \
	openssl \
	passwd \
	patch \
	perl \
	procps-ng \
	psmisc \
	python{3,}-pip \
	rsync \
	socat \
	ssmtp \
	sudo \
	supervisor \
	tar \
	vim-minimal \
	which \
	xz \
	&& dnf clean all \
	&& ln -s gpg2 /usr/bin/gpg \
	&& groupadd -og $(id -g nobody) nogroup \
	&& rsync -a --del /etc/skel/ /root/ \
	&& passwd --lock root

ENV LANG="en_US.UTF-8" LC_COLLATE="C"

CMD ["bash"]
