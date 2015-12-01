#!/bin/bash
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}' | cut -d: -f1)
find ${HOST}/usr/local/ ${HOST}/etc/systemd/user/ \
-name "*${INAME}*" -exec rm -rfv "{}" \;
