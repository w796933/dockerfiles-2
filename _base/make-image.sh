#!/bin/bash -eu
# Based on kaorimatz/docker-base-images

if [ $# -ne 3 ]; then
  echo "Usage: $0 REPO NAME RELEASE"
  exit 1
fi

if [ $UID -ne 0 ]; then
  exec sudo "$0" "$@"
fi

SCRIPTDIR=$(realpath "$(dirname "$0")")
. "$SCRIPTDIR"/vars

cp -nv "$SCRIPTDIR"/rpm-gpg/* /etc/pki/rpm-gpg/
restorecon -R /etc/pki/rpm-gpg/ || :

rm -rf "$CHROOT"
mkdir -p "$CHROOT"/dev
mknod -m 666 "$CHROOT"/dev/null c 1 3
mknod -m 666 "$CHROOT"/dev/urandom c 1 9
mknod -m 666 "$CHROOT"/dev/tty c 5 0
mknod -m 600 "$CHROOT"/dev/console c 5 1

dnf -y \
  --disablerepo='*' \
  $(for i in "${REPOS[@]}"; do echo "--enablerepo=$i"; done) \
  $([[ "$GPGCHECK" -eq 0 ]] && echo "--nogpgcheck") \
  --installroot="$CHROOT" \
  --releasever="$RELEASE" \
  --setopt=reposdir="$REPOSDIR" \
  --setopt=cachedir="$CACHEDIR" \
  --setopt=keepcache=true \
  --setopt=tsflags=nodocs \
  install "${PACKAGES[@]}"

localedef --prefix "$CHROOT" --list-archive | \
  grep -a -v en_US.utf8 | \
  xargs localedef --prefix "$CHROOT" --delete-from-archive

mv "$CHROOT"/usr/lib/locale/locale-archive{,.tmpl}
chroot "$CHROOT" /usr/sbin/build-locale-archive
find "$CHROOT"/usr/share/locale -mindepth 1 -maxdepth 1 -not -name en \
  -and -not -name en_US -and -not -name locale.alias -exec rm -rf {} +
find "$CHROOT"/usr/share/i18n/locales -mindepth 1 -maxdepth 1 \
  -not -name en_US -exec rm -rf {} +
find "$CHROOT"/usr/share/i18n/charmaps -mindepth 1 -maxdepth 1 \
  -not -name UTF-8.gz -exec rm -rf {} +
echo '%_install_langs en_US' > "$CHROOT"/etc/rpm/macros.mkimage

for i in "$CHROOT"/etc/yum.conf "$CHROOT"/etc/dnf/dnf.conf; do
  if [[ -f "$i" ]]; then
    awk '(NF==0 && !done) { print "tsflags=nodocs"; done=1 } { print }
    END { if (!done) print "tsflags=nodocs" }' "$i" > "$i".new
    mv "$i"{.new,}
  fi
done

cp -av --no-preserve=ownership "$SCRIPTDIR"/rootfs/* "$CHROOT"/
chroot "$CHROOT" /bin/update-ca-trust
chroot "$CHROOT" /bin/rsync -a --delete /etc/skel/ /root/
chroot "$CHROOT" /sbin/groupadd -og $(/bin/id -g nobody) nogroup
rm -rf "$CHROOT"/etc/machine-id
rm -rf "$CHROOT"/{boot,media,mnt,tmp}/*

tar -cC "$CHROOT" . | docker import -c "ENV $DOCKER_ENV" - "$DOCKER_IMAGE"
rm -rf "$CHROOT"
