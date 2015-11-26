#!/bin/bash
rm -rfv ${HOST}/etc/openvpn-* \
${HOST}/etc/systemd/system/{multi-user.target.wants/,}openvpn@*.service
