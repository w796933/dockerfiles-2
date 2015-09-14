FROM quay.io/nightling/base-desktop:fc22
MAINTAINER Nightling

RUN curl -o /tmp/.run https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run \
	&& useradd -ld /data user \
	&& sudo -iu user sh /tmp/.run \
	&& rm -f /tmp/.run \
	&& mv /data/.local/share/tresorit/ /opt/tresorit/ \
	&& ln -s /opt/tresorit/tresorit /usr/bin/ \
	&& for dir in Logs Profiles Updates; do \
		ln -s /data/tresorit/$dir /opt/tresorit/$dir; \
	done

ENTRYPOINT ["tresorit"]
