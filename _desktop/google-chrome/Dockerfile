FROM oszi/base-desktop:fc23

ADD etc /etc

RUN dnf -y install google-chrome-stable \
	&& dnf clean all \
	&& sed -i -E 's:(.*(http|html).*)=(.*):\1=google-chrome.desktop:g' \
	/usr/share/applications/mimeapps.list

COPY google-chrome* /usr/share/install/

ENTRYPOINT ["google-chrome"]
