#!/bin/bash
rm -rfv ${HOST}/var/lib/znc-* \
${HOST}/usr/local/sbin/znc-setup \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}znc@*.service
