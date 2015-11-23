FROM quay.io/oszi/base-desktop:fc23-devel

# Dependencies from Fedora
RUN dnf -y install \
	libgcrypt-devel \
	libXtst-devel \
	qt-devel \
	zlib-devel \
	&& dnf clean all

COPY usr /usr

RUN cd /usr/src/keepassx \
	&& mkdir build \
	&& pushd build \
	&& cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
	&& make -j8 \
	&& make install \
	&& popd \
	&& rm -rf build

COPY keepassx* /usr/share/install/

ENTRYPOINT ["keepassx"]
