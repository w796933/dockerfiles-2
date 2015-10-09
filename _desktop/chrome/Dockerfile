FROM quay.io/oszi/base-desktop:fc22

ADD etc /etc

RUN dnf -y install google-chrome-stable \
	&& dnf clean all

ENTRYPOINT ["google-chrome"]
CMD ["--incognito"]
