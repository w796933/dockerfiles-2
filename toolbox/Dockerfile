FROM nightling/buildpack:22
MAINTAINER Nightling

# Expect all packages from the base images...

RUN dnf -y install \
	arptools \
	binwalk \
	checksec \
	dnsenum \
	etcd \
	foremost \
	gdb \
	goaccess \
	hexedit \
	httpd-tools \
	iperf \
	irssi \
	kubernetes-client \
	ltrace \
	net-tools \
	nmap \
	openssh-server \
	p7zip \
	pcapdiff \
	speedtest-cli \
	sslscan \
	sslsplit \
	strace \
	subnetcalc \
	tcpdump \
	tcpreplay \
	telnet \
	tmux \
	tor \
	traceroute \
	vim-enhanced \
	w3m \
	whois \
	zmap \
	&& mv $(which etcdctl) /usr/local/bin/ \
	&& dnf -y erase etcd \
	&& dnf clean all

COPY root /root
VOLUME /root
WORKDIR /root

EXPOSE 22 80 443 1337 1337/udp

CMD ["bash"]
