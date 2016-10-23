mkdir -p ${HOST}/etc/containers/backup/
cp -av backup-container.sh ${HOST}/etc/containers/backup/

cat <<EOF > ${HOST}/etc/profile.d/backup_container.sh
alias backup-container='/etc/containers/backup/backup-container.sh'
EOF
