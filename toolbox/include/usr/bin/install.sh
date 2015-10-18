#!/bin/sh
# If no image tag is specified, expose it.
[[ $(echo ${IMAGE} | awk -F/ '{print $(NF)}') =~ ':' ]] || IMAGE="${IMAGE}:\${TAG}"

sed "s;__IMAGE__;${IMAGE};g" /usr/share/install/aliases.sh \
> ${HOST}/etc/profile.d/toolbox-aliases.sh

cp /etc/profile.d/docker-aliases.sh ${HOST}/etc/profile.d/

echo "source /etc/profile.d/"{toolbox,docker}"-aliases.sh;"
