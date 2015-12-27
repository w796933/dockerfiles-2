#!/bin/bash
rm -rfv ${HOST}/mnt/torrent/.{bash,rt,ru}* \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}rtorrent.service
