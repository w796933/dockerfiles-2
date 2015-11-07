FROM quay.io/oszi/base-desktop:fc23

RUN dnf -y install firefox \
	&& dnf clean all \
	&& sed -i -E 's:(.*(http|html).*)=(.*):\1=firefox.desktop:g' \
	/usr/share/applications/mimeapps.list

COPY firefox* /usr/share/install/

ENTRYPOINT ["firefox"]
