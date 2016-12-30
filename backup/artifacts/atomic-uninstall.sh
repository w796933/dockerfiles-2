if [ -L ${ENVROOT}/${INAME} ]; then
  if [[ $(readlink ${ENVROOT}/${INAME}) =~ ^(.+/)?${NAME}$ ]]; then
    rm -fv ${ENVROOT}/${INAME}
  fi
fi

if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/containers/backup-shell.sh \
  ${HOST}/etc/profile.d/backup_container.sh
fi
