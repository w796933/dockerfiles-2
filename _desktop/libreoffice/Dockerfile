FROM nightling/base-gui:22
MAINTAINER Nightling

RUN dnf -y groups install LibreOffice \
	&& dnf -y install libreoffice-{postgresql,langpack-hu} \
	&& dnf clean all

ENTRYPOINT ["entrypoint", "libreoffice"]
