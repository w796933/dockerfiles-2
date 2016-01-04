#!/bin/bash -eu
# Based on kaorimatz/docker-base-images

if [[ $UID -ne 0 ]]; then
  exec sudo "$0" "$@"
fi

scriptdir=$(realpath "$(dirname "$0")")
. "$scriptdir"/vars

cp -nv "$scriptdir"/rpm-gpg/* /etc/pki/rpm-gpg/
restorecon -R /etc/pki/rpm-gpg/ || true

rm -rf "$installroot"
mkdir -p "$installroot"/dev
mknod -m 666 "$installroot"/dev/null c 1 3
mknod -m 666 "$installroot"/dev/urandom c 1 9
mknod -m 666 "$installroot"/dev/tty c 5 0
mknod -m 600 "$installroot"/dev/console c 5 1

dnf -y \
  --disablerepo='*' \
  $(for repo in "${repos[@]}"; do echo "--enablerepo=$repo"; done) \
  $([[ "$gpgcheck" -eq 0 ]] && echo "--nogpgcheck") \
  --installroot="$installroot" \
  --releasever="$version" \
  --setopt=reposdir="$reposdir" \
  --setopt=cachedir="$cachedir" \
  --setopt=keepcache=true \
  --setopt=tsflags=nodocs \
  install "${packages[@]}"

localedef --prefix "$installroot" --list-archive | \
  grep -a -v en_US.utf8 | \
  xargs localedef --prefix "$installroot" --delete-from-archive

mv "$installroot"/usr/lib/locale/locale-archive{,.tmpl}
chroot "$installroot" /usr/sbin/build-locale-archive
find "$installroot"/usr/share/locale -mindepth 1 -maxdepth 1 -not -name en \
  -and -not -name en_US -and -not -name locale.alias -exec rm -rf {} +
find "$installroot"/usr/share/i18n/locales -mindepth 1 -maxdepth 1 \
  -not -name en_US -exec rm -rf {} +
find "$installroot"/usr/share/i18n/charmaps -mindepth 1 -maxdepth 1 \
  -not -name UTF-8.gz -exec rm -rf {} +
echo '%_install_langs en_US' > "$installroot"/etc/rpm/macros.mkimage

for config in "$installroot"/etc/yum.conf "$installroot"/etc/dnf/dnf.conf; do
  if [[ -f "$config" ]]; then
    awk '(NF==0 && !done) { print "tsflags=nodocs"; done=1 } { print }
    END { if (!done) print "tsflags=nodocs" }' "$config" > "$config".new
    mv "$config"{.new,}
  fi
done

cp -rv "$scriptdir"/rpmfusion "$installroot"/usr/share/
cp -rv "$scriptdir"/ca-trust-anchors/* "$installroot"/etc/pki/ca-trust/source/anchors/
chroot "$installroot" /bin/update-ca-trust
chroot "$installroot" /bin/rsync -a --delete /etc/skel/ /root/
chroot "$installroot" /sbin/groupadd -og $(/bin/id -g nobody) nogroup
rm -rf "$installroot"/etc/machine-id
rm -rf "$installroot"/{boot,media,mnt,tmp}/*

tar -cC "$installroot" . | docker import -c "ENV $docker_env" - "$docker_image"
rm -rf "$installroot"
