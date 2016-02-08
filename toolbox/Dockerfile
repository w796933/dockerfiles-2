FROM oszi/buildpack:fc23

# Expect all packages from the base images...

RUN dnf -y install \
	arptools \
	atomic \
	atop \
	binwalk \
	blktrace \
	btrfs-progs \
	checksec \
	device-mapper \
	dnsenum \
	docker \
	docker-compose \
	duplicity \
	e2fsprogs \
	etcd \
	ethtool \
	fatrace \
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
	kubernetes \
	lftp \
	lsof \
	ltrace \
	lxc \
	mailx \
	mc \
	net-tools \
	nmap \
	numactl \
	openssh-server \
	p7zip \
	pcapdiff \
	pciutils \
	rsnapshot \
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
	\
	pycryptopp \
	python-boto \
	python-keystoneclient \
	python-paramiko \
	python-pexpect \
	python-requests \
	python-requests-oauthlib \
	python-swiftclient \
	python-urllib3 \
	&& dnf clean all

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/profile.d:/host/etc/profile.d:rw \
	-v /usr/local:/host/usr/local:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /etc/profile.d:/host/etc/profile.d:rw \
	-v /usr/local:/host/usr/local:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run -it --rm --privileged --name=\${NAME} \
	--net=host --ipc=host --pid=host \
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
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

VOLUME ["/var/lib/docker"]

ENV DOCKER_DRIVER overlay

EXPOSE 2375 5001 8080 1337 1337/udp

COPY . /

WORKDIR /root

CMD ["bash"]
