if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/profile.d/toolbox_container.sh \
  ${HOST}/etc/profile.d/docker_aliases.sh
fi
