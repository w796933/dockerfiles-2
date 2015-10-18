FROM quay.io/oszi/base-desktop:fc22

RUN curl -o /tmp/.rpm http://download.skype.com/linux/skype-4.3.0.37-fedora.i586.rpm \
	&& echo "2318acc6d275daa90c98f5edf642b7cad9369f87 /tmp/.rpm" | sha1sum -c - \
	&& dnf -y install /tmp/.rpm && rm -f /tmp/.rpm \
	&& dnf clean all

COPY skype* /usr/share/install/

ENTRYPOINT ["skype"]
