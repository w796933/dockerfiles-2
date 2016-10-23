if [ "$NAME" != "$INAME" ]; then
  echo "There can be only one! NAME=${INAME}" >&2
  atomic-uninstall erase &> /dev/null
  exit 1
fi

cp -av pwnie.sh ${HOST}/${CONFDIR}/
cat <<EOF > ${HOST}/etc/profile.d/pwnie_container.sh
alias pwnie="${CONFDIR}/pwnie.sh"
EOF
