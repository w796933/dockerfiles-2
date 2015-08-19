FROM nightling/base-gui:22
MAINTAINER Nightling

RUN curl -o /tmp/.run https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run \
	&& sudo -iu user sh /tmp/.run \
	&& rm -f /tmp/.run \
	&& mv /data/.local/share/tresorit/ /opt/tresorit/ \
	&& for dir in Logs Profiles Updates; do \
		ln -s /data/tresorit/$dir /opt/tresorit/$dir; \
	done

VOLUME /data/tresorit

ENTRYPOINT ["entrypoint", "/opt/tresorit/tresorit"]
