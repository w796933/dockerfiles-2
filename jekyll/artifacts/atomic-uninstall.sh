if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/profile.d/jekyll_container.sh
fi
