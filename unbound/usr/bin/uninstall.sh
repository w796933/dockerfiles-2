#!/bin/bash
rm -rfv ${HOST}/etc/unbound/conf.d \
${HOST}/usr/local/sbin/unbound-control \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}{dns,unbound}.service
