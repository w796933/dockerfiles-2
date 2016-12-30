FROM ${REGISTRY}/buildpack:${DIST}

# Expect all packages from the base images...

RUN ${YUM} -y install \
	ansible \
	ansible-lint \
	atomic \
	atop \
	blktrace \
	btrfs-progs \
	checksec \
	device-mapper \
	docker \
	docker-compose \
	e2fsprogs \
	etcd \
	ethtool \
	fpaste \
	gdb \
	goaccess \
	hexedit \
	htop \
	httpd-tools \
	hwloc \
	iftop \
	iotop \
	iperf \
	irssi \
	kubernetes \
	lftp \
	lshw \
	lsof \
	ltrace \
	lxc \
	mailx \
	mc \
	nano \
	net-tools \
	netsniff-ng \
	nmap \
	numactl \
	openssh-server \
	p7zip \
	perf \
	runc \
	screen \
	skopeo \
	speedtest-cli \
	sshuttle \
	sslscan \
	strace \
	stunnel \
	subnetcalc \
	sysstat \
	tcpdump \
	tcpreplay \
	telnet \
	testdisk \
	tmux \
	traceroute \
	tree \
	unar \
	vim-enhanced \
	w3m \
	whois \
	xfsprogs \
	GeoIP-GeoLite-data-extra \
	&& ${YUM} clean all

COPY . /

LABEL Name=${INAME} Version=${DIST} Release=${RELEASE} \
	RUN="/usr/bin/docker run --rm --name=\${NAME} \
	--net=host --ipc=host --pid=host --privileged \
	-v /:/host:rw -e HOST=/host -w /host \
	-v /boot:/boot:ro \
	-v /dev:/dev:rw \
	-v /etc/environment:/etc/environment:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /home:/home:rw \
	-v /media:/media:rw \
	-v /mnt:/mnt:rw \
	-v /run:/run:rw \
	-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
	-v /tmp:/tmp:rw \
	-i -t -e TERM=xterm-256color \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-} \${IMAGE}"

ENV DOCKER_DRIVER overlay

VOLUME ["/var/lib/docker", "/var/tmp", "/tmp"]

WORKDIR /root

CMD ["bash"]
