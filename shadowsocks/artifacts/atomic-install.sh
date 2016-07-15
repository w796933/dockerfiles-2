#!/bin/bash -eu
rsync -av --ignore-existing /etc/shadowsocks-libev/ ${HOST}/${CONFDIR}/
