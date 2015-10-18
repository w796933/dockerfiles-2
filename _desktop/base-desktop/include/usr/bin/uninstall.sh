#!/bin/sh
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}')
find ${HOST}/usr/local/ -name "*${INAME}*" -exec rm -rf "{}" \;
