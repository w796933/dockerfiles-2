FROM nightling/base-gui:22
MAINTAINER Nightling

ADD google-chrome.repo /etc/yum.repos.d/

RUN dnf -y install google-chrome-stable \
	&& dnf clean all

ENTRYPOINT ["entrypoint", "google-chrome"]
CMD ["--incognito"]
