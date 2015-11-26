#!/bin/bash
rm -rfv ${HOST}/var/lib/supybot-* \
${HOST}/usr/local/sbin/supybot-setup \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}supybot*.service*
