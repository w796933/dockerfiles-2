FROM oszi/base-desktop:fc23

RUN curl -o /tmp/.run https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run \
	&& useradd -ld /data user \
	&& sudo -iu user sh /tmp/.run \
	&& rm -f /tmp/.run \
	&& mv /data/.local/share/tresorit/ /opt/tresorit/ \
	&& chmod 0777 /opt/tresorit/ \
	&& cp /opt/tresorit/tresorit.png /usr/share/pixmaps/ \
	&& ln -s /opt/tresorit/tresorit /usr/bin/ \
	&& for DIR in Logs Profiles Updates; do \
		ln -s /data/.tresorit/${DIR} /opt/tresorit/${DIR}; \
	done

COPY usr /usr

ENTRYPOINT ["tresorit"]
