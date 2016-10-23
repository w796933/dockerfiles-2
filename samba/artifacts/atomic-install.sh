if [ "$NAME" != "$INAME" ]; then
  echo "There can be only one! NAME=${INAME}" >&2
  atomic-uninstall erase &> /dev/null
  exit 1
fi

rsync -av --ignore-existing /etc/samba/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/samba/ ${HOST}/${DATADIR}/

. atomic-update.sh
