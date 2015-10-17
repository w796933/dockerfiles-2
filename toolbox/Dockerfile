FROM quay.io/oszi/buildpack:fc22

# Expect all packages from the base images...

RUN dnf -y install \
	arptools \
	atop \
	binwalk \
	blktrace \
	btrfs-progs \
	checksec \
	dnsenum \
	e2fsprogs \
	etcd \
	ethtool \
	foremost \
	fpaste \
	gdb \
	goaccess \
	hexedit \
	htop \
	httpd-tools \
	hwloc \
	iftop \
	iperf \
	irssi \
	kubernetes-client \
	ltrace \
	mailx \
	mc \
	net-tools \
	nmap \
	numactl \
	openssh-server \
	p7zip \
	pcapdiff \
	pciutils \
	speedtest-cli \
	sslscan \
	sslsplit \
	strace \
	subnetcalc \
	sysstat \
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
	xfsprogs \
	zmap \
	&& mv $(which etcdctl) /usr/local/bin/ \
	&& dnf -y erase etcd \
	&& dnf clean all

COPY include /

VOLUME /root

WORKDIR /root

EXPOSE 22 80 443 1337 1337/udp

CMD ["bash"]
