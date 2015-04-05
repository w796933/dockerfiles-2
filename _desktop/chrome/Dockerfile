FROM nightling/base-gui

ADD google-chrome.repo /etc/yum.repos.d/

RUN dnf -y install google-chrome-stable \
	&& dnf clean all

ENTRYPOINT ["entrypoint", "google-chrome"]
CMD ["--incognito"]
