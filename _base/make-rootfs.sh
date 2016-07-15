#!/bin/bash -eu
# Usage: ./make-rootfs.sh rootfs.tar
rm -f "$1"

# Initialize the chroot
mkdir -p /rootfs/dev
mknod -m 0666 /rootfs/dev/null c 1 3
mknod -m 0666 /rootfs/dev/urandom c 1 9
mknod -m 0666 /rootfs/dev/tty c 5 0
mknod -m 0600 /rootfs/dev/console c 5 1

# Install the requested packages
$(which dnf || which yum) -y \
  --installroot=/rootfs \
  --disablerepo='*' \
  $(for i in ${REPOS}; do echo "--enablerepo=$i"; done) \
  --releasever=${OSREL} \
  --setopt=tsflags=nodocs \
  install ${PACKAGES}

# Clean up locales...
localedef --prefix /rootfs --list-archive | \
  grep -a -v en_US.utf8 | \
  xargs localedef --prefix /rootfs --delete-from-archive

mv /rootfs/usr/lib/locale/locale-archive{,.tmpl}
chroot /rootfs /usr/sbin/build-locale-archive

find /rootfs/usr/share/locale -mindepth 1 -maxdepth 1 -not -name en \
  -and -not -name en_US -and -not -name locale.alias -exec rm -rf {} +
find /rootfs/usr/share/i18n/locales -mindepth 1 -maxdepth 1 \
  -not -name en_US -exec rm -rf {} +
find /rootfs/usr/share/i18n/charmaps -mindepth 1 -maxdepth 1 \
  -not -name UTF-8.gz -exec rm -rf {} +
echo '%_install_langs en_US' > /rootfs/etc/rpm/macros.mkimage

# Disable automatic installation of man pages
for i in /rootfs/etc/yum.conf /rootfs/etc/dnf/dnf.conf; do
  if [[ -f "$i" ]]; then
    awk '(NF==0 && !done) { print "tsflags=nodocs"; done=1 } { print }
    END { if (!done) print "tsflags=nodocs" }' "$i" > "$i".new
    mv "$i"{.new,}
  fi
done

# Set up root's home directory
rm -rf /rootfs/root
cp -av --no-preserve=ownership /rootfs/etc/skel /rootfs/root

# Post-install customizations!
cp -av --no-preserve=ownership ./rootfs/* /rootfs/
chroot /rootfs /bin/update-ca-trust
chroot /rootfs /sbin/groupadd -og $(/bin/id -g nobody) nogroup
chroot /rootfs /sbin/groupadd -g "$XGID" "$XUSER"
chroot /rootfs /sbin/useradd -lg "$XGID" -u "$XUID" -md "$XHOME" "$XUSER"

# Clean up the filesystem...
rm -rf /rootfs/{media,mnt,tmp,var/{cache,tmp}}/*
rm -rf /rootfs/{boot,srv,etc/machine-id}

# Tar up the rootfs
tar -cC /rootfs -f "$1" .
