cp -av openvpn-shell.sh ${HOST}/etc/containers/

cat <<EOF > ${HOST}/etc/profile.d/openvpn_container.sh
alias openvpn-shell='/etc/containers/openvpn-shell.sh'
EOF
