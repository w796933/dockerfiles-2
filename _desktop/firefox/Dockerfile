FROM nightling/base-gui

RUN dnf -y install firefox \
	&& dnf clean all

ENTRYPOINT ["entrypoint", "firefox"]
