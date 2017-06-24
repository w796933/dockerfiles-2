FROM ${REGISTRY}/buildpack:${DIST}

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
	\
	american-fuzzy-lop \
	arptools \
	binwalk \
	dnsenum \
	foremost \
	masscan \
	pcapdiff \
	speedtest-cli \
	sslsplit \
	steghide \
	tor \
	valgrind \
	z3 \
	zmap \
	\
	GeoIP-GeoLite-data-extra \
	capstone-devel \
	libini_config-devel.* \
	pyserial \
	python-afl \
	python-afl-bin \
	python-mako \
	python-prettytable \
	python-pyelftools \
	python-pygments \
	python-z3 \
	python2-argh \
	python2-dateutil \
	python2-docopt \
	python2-paramiko \
	python2-pysocks \
	python2-requests \
	PyYAML \
	scapy \
	&& ${YUM} clean all

COPY . /

RUN set -e; \
	python2 -m pip install --upgrade pip; \
	\
	mv -f /usr/bin/checksec /tmp/; \
	for APP in ROPgadget pwntools HashPump xortool; do \
		cd /usr/src/${APP}; \
		python2 setup.py install; \
		python2 setup.py clean --all; \
	done; \
	mv -f /tmp/checksec /usr/bin/; \
	\
	cd /usr/src/HashPump; \
	make; \
	make install; \
	make clean; \
	\
	cd /opt/preeny; \
	make CFLAGS=-m32 && mv *-*-* lib32; \
	make && mv *-*-* lib64; \
	make clean; \
	\
	go get github.com/asciimoo/wuzz; \
	\
	rm -rf ~/.cache;

LABEL RUN="/usr/bin/docker run --rm --name=\${NAME} \
	--network=host --ipc=host --pid=host --privileged \
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
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /sys/fs/selinux:/sys/fs/selinux:ro \
	-v /tmp:/tmp:rw \
	-i -t -e TERM=xterm-256color \
	-e NAME=\${NAME} -e IMAGE=\${IMAGE} \
	\${DOCKER_OPTS} \${IMAGE}"

ENV SYSTEMD_IGNORE_CHROOT=1

VOLUME ["/root", "/var/lib/docker", "/var/tmp", "/tmp"]

WORKDIR /root

CMD ["bash"]
