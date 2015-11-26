#!/bin/bash
rm -rfv ${HOST}/var/lib/tircd \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}tircd.service
