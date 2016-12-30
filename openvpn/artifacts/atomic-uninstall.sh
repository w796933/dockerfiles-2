if [ $(find_instances | wc -l) -eq 0 ]; then
  rm -fv ${HOST}/etc/containers/openvpn-shell.sh \
  ${HOST}/etc/profile.d/openvpn_container.sh
fi
