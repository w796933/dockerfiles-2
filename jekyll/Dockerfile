FROM oszi/buildpack:fc23

RUN dnf -y install \
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
	rubygem-redcarpet \
	rubygem-RedCloth \
	rubygem-therubyracer \
	rubygem-thread_safe \
	rubygem-tzinfo \
	python-pygments \
	&& dnf clean all

ENV VERSION 3

RUN gem install \
	jekyll:${VERSION} \
	jekyll-coffeescript \
	jekyll-compose \
	jekyll-feed \
	jekyll-mentions \
	jekyll-redirect-from \
	jekyll-sass-converter \
	jekyll-sitemap \
	pygments.rb

LABEL INSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=install.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

LABEL UNINSTALL /usr/bin/docker run --rm --privileged \
	-v /:/host --entrypoint=uninstall.sh \
	-e HOST=/host -e IMAGE=\${IMAGE} \${IMAGE}

COPY usr /usr

ENTRYPOINT ["jekyll"]
