if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/firewalld/services/plex.xml
fi
