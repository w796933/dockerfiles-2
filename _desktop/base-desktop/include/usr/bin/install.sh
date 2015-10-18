#!/bin/sh
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}')

# If no image tag is specified, expose it.
[[ ${INAME} =~ ':' ]] || IMAGE="${IMAGE}:\${TAG}"

pushd /usr/share

find . -name "*${INAME}*" > /tmp/files
rsync -av --files-from=/tmp/files --exclude-from=./install/ignore ./ ${HOST}/usr/local/share/

find ./install/ -type f -executable -exec sed -i "s;__IMAGE__;${IMAGE};g" "{}" \;
find ./install/ -type f -executable -exec cp -av "{}" ${HOST}/usr/local/bin/ \;
popd
