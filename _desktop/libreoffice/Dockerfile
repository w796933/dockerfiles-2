FROM quay.io/oszi/base-desktop:fc22

RUN dnf -y groups install LibreOffice \
	&& dnf -y install libreoffice-{postgresql,langpack-hu} \
	&& dnf clean all

ENTRYPOINT ["libreoffice"]
