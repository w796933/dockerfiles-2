if [ "$NAME" != "$INAME" ]; then
  echo "There can be only one! NAME=${INAME}" >&2
  atomic-uninstall erase &> /dev/null
  exit 1
fi

cp -av jekyll.sh ${HOST}/${CONFDIR}/
cat <<EOF > ${HOST}/etc/profile.d/jekyll_container.sh
alias jekyll="${CONFDIR}/jekyll.sh"
EOF
