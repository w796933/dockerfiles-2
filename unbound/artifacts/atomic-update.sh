cp -av unbound-control.sh ${HOST}/${CONFDIR}/
cat <<EOF > ${HOST}/etc/profile.d/unbound_container.sh
if [ ! -e /usr/sbin/unbound-control ]; then
  alias unbound-control="${CONFDIR}/unbound-control.sh"
fi
EOF
