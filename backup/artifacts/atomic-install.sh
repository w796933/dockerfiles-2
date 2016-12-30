# backup-shell sources the default instance...
if [ ! -f ${ENVROOT}/${INAME} ]; then
  ln -s ${NAME} ${ENVROOT}/${INAME}
fi

cp -av backup-shell.sh ${HOST}/etc/containers/
cat <<EOF > ${HOST}/etc/profile.d/backup_container.sh
alias backup-shell="/etc/containers/backup-shell.sh"
EOF
