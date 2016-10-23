cp -av samba-shell.sh ${HOST}/${CONFDIR}/
cat <<EOF > ${HOST}/etc/profile.d/samba_container.sh
if [ ! -e /usr/bin/smbcontrol ]; then
  alias smbcontrol="${CONFDIR}/samba-shell.sh smbcontrol"
  alias smbpasswd="${CONFDIR}/samba-shell.sh smbpasswd"
  alias smbstatus="${CONFDIR}/samba-shell.sh smbstatus"
fi
EOF
