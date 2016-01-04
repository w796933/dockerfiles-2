#!/bin/bash
rm -rfv ${HOST}/var/lib/rtorrent/ \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}rtorrent.service
