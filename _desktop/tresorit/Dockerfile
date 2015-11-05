FROM quay.io/oszi/base-desktop:fc23

RUN curl -o /tmp/.run https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run \
	&& useradd -ld /data user \
	&& sudo -iu user sh /tmp/.run \
	&& rm -f /tmp/.run \
	&& mv /data/.local/share/tresorit/ /opt/tresorit/ \
	&& ln -s /opt/tresorit/tresorit /usr/local/bin/ \
	&& for DIR in Logs Profiles Updates; do \
		ln -s /data/.tresorit/${DIR} /opt/tresorit/${DIR}; \
	done

COPY tresorit* /usr/share/install/

ENTRYPOINT ["tresorit"]
