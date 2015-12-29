#!/bin/bash
rm -rfv ${HOST}/etc/samba \
${HOST}/var/lib/samba \
${HOST}/usr/local/sbin/smb* \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}{smb,nmb}.service*
