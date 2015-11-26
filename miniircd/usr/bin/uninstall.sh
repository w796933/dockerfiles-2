#!/bin/bash
rm -rfv ${HOST}/var/lib/miniircd \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}miniircd.service
