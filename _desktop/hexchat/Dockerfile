FROM quay.io/oszi/base-desktop:fc22

RUN dnf -y install hexchat enchant \
	&& dnf clean all

ENTRYPOINT ["hexchat"]
