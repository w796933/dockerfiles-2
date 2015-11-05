FROM quay.io/oszi/buildpack:fc23

# Expect all packages from the base images...

RUN dnf -y install \
	atomic \
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

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run --rm -it --security-opt=label:disable \
	--cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
	--net=host --ipc=host --pid=host \
	-v /:/host:rw -w /host \
	-v /boot:/boot:ro \
	-v /etc/environment:/etc/environment:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /etc/systemd:/etc/systemd:rw \
	-v /home:/home:rw \
	-v /media:/media:rw \
	-v /mnt:/mnt:rw \
	-v /run:/run:rw \
	-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
	-v /var/log:/var/log:rw \
	-e HOST=/host -e IMAGE=\${IMAGE} \${OPT1} \${IMAGE}

COPY include /

VOLUME /root

WORKDIR /root

EXPOSE 22 80 443 1337 1337/udp

CMD ["bash"]
