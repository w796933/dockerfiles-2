FROM ${REGISTRY}/buildpack:${DIST}

# Expect all packages from the base images...

RUN dnf -y install \
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
	&& dnf clean all

COPY . /

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/profile.d:/host/etc/profile.d:rw \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/profile.d:/host/etc/profile.d:rw \
	-v /usr/local/sbin:/host/usr/local/sbin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -it --rm --name=\${NAME} \
	--net=host --ipc=host --pid=host --privileged \
	-v /:/host:rw -e HOST=/host -w /host \
	-v /boot:/boot:ro \
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
	-e TERM=\$(tset -q) \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS-} \${IMAGE}

ENV DOCKER_DRIVER overlay

VOLUME ["/var/lib/docker", "/var/tmp", "/tmp"]

WORKDIR /root

CMD ["bash"]
