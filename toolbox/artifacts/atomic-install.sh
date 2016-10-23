if [ "$NAME" != "$INAME" ]; then
  echo "There can be only one! NAME=${INAME}" >&2
  atomic-uninstall erase &> /dev/null
  exit 1
fi

cp -av /etc/profile.d/docker_aliases.sh ${HOST}/etc/profile.d/
cp -av toolbox*.sh ${HOST}/${CONFDIR}/

cat <<EOF > ${HOST}/etc/profile.d/toolbox_container.sh
alias toolbox="${CONFDIR}/toolbox.sh"
alias toolbox-attach="${CONFDIR}/toolbox-attach.sh"
alias toolbox-host="${CONFDIR}/toolbox-host.sh"
EOF
