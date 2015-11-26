#!/bin/bash
# If no image tag is specified, expose it.
[[ $(echo ${IMAGE} | awk -F/ '{print $(NF)}') =~ ':' ]] || IMAGE="${IMAGE}:\${TAG}"

cp -av /usr/share/install/pwnie* ${HOST}/usr/local/bin/
sed -i "s;__IMAGE__;${IMAGE};g"  ${HOST}/usr/local/bin/pwnie*
