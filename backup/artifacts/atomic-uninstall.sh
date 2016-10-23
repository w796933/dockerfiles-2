if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/containers/backup/backup-container.sh \
  ${HOST}/etc/profile.d/backup_container.sh
fi
