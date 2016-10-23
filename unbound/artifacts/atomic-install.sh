if [ "$NAME" != "$INAME" ]; then
  echo "There can be only one! NAME=${INAME}" >&2
  atomic-uninstall erase &> /dev/null
  exit 1
fi

unbound-control-setup -d ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /etc/unbound/ ${HOST}/${CONFDIR}/
rsync -av --ignore-existing /var/lib/unbound/ ${HOST}/${DATADIR}/

. atomic-update.sh
