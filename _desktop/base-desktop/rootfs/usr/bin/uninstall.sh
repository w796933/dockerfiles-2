#!/bin/bash -u
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}' |  awk -F: '{print $1}')
find ${HOST}/usr/local/ -name "*${INAME}*" -exec rm -rfv "{}" \;
rm -fv ${HOST}/etc/systemd/user/${INAME}*
