#!/bin/sh
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}' | cut -d: -f1)
find ${HOST}/usr/local/ -name "${INAME}*" -exec rm -rf "{}" \;
