FROM quay.io/oszi/buildpack:fc22

# Expect all packages from the base images...

RUN dnf -y install \
	arptools \
	atop \
	binwalk \
	checksec \
	dnsenum \
	etcd \
	ethtool \
	foremost \
	gdb \
	goaccess \
	hexedit \
	htop \
	httpd-tools \
	iftop \
	iperf \
	irssi \
	kubernetes-client \
	ltrace \
	mc \
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
	tree \
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
