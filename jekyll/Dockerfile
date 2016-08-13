FROM ${REGISTRY}/buildpack:${DIST}

RUN ${YUM} -y install \
	ruby-devel \
	rubygem-activesupport \
	rubygem-i18n \
	rubygem-kramdown \
	rubygem-liquid \
	rubygem-maruku \
	rubygem-mini_portile \
	rubygem-nokogiri \
	rubygem-posix-spawn \
	rubygem-rdiscount \
	rubygem-rdoc \
	rubygem-redcarpet \
	rubygem-RedCloth \
	rubygem-therubyracer \
	rubygem-thread_safe \
	rubygem-tzinfo \
	python-pygments \
	&& ${YUM} clean all

RUN gem install \
	jekyll \
	jekyll-coffeescript \
	jekyll-compose \
	jekyll-feed \
	jekyll-mentions \
	jekyll-redirect-from \
	jekyll-sass-converter \
	jekyll-sitemap \
	pygments.rb

LABEL INSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-install \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /usr/local/bin:/host/usr/local/bin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged --entrypoint=atomic-uninstall \
	-v /etc/sysconfig/containers:/host/etc/sysconfig/containers:rw \
	-v /usr/local/bin:/host/usr/local/bin:rw \
	-e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE}

LABEL RUN /usr/bin/docker run --rm -itu \${SUDO_UID:-\$UID}:\${SUDO_GID:-\$GID} \
	--net=host --cap-drop=ALL --read-only --security-opt=label:disable \
	-v \"\$(pwd):\$(pwd)\" -w \"\$(pwd)\" --name=\${NAME} \${IMAGE}

COPY . /

ENTRYPOINT ["jekyll"]
