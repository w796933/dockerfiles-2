mkdir -p ${HOST}/etc/containers/openvpn/
cp -av openvpn-shell.sh ${HOST}/etc/containers/openvpn/

cat <<EOF > ${HOST}/etc/profile.d/openvpn_container.sh
alias openvpn-shell='/etc/containers/openvpn/openvpn-shell.sh'
EOF
