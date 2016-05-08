IMAGE    := $(REGISTRY)/$(BASE):$(OSREL)
BUILDIMG := $(REGISTRY)/$(BASE):23
VARS     += XUSER XHOME XUID XGID REPOS PACKAGES

XUSER    := container
XHOME    := /data
XUID     := 65000
XGID     := 65000

REPOS    := fedora updates
PACKAGES := \
	bash \
	bind-utils \
	bzip2 \
	coreutils \
	curl \
	dnf \
	dnf-plugins-core \
	file \
	findutils \
	gnupg2 \
	hostname \
	icu \
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
	python \
	python3 \
	rpm \
	rsync \
	socat \
	sqlite \
	sudo \
	systemd \
	tar \
	util-linux \
	vim-minimal \
	which \
	xz \
	zip \
