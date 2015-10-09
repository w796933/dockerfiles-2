FROM quay.io/oszi/base-desktop:fc22

RUN dnf -y install firefox \
	&& dnf clean all

ENTRYPOINT ["firefox"]
