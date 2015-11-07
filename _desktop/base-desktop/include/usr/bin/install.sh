#!/bin/sh
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}')

if [[ ${INAME} =~ ':' ]]; then
  INAME=$(echo ${INAME} | cut -d: -f1)
else
  # If no image tag is specified, expose it.
  IMAGE="${IMAGE}:\${TAG}"
fi

pushd /usr/share/

find . -name "*${INAME}*" > /tmp/files
rsync -av --files-from=/tmp/files --exclude-from=./install/ignore ./ ${HOST}/usr/local/share/

find ./install/ -type f -executable -exec sed -i "s;__IMAGE__;${IMAGE};g" "{}" \;
find ./install/ -type f -executable -exec cp -av "{}" ${HOST}/usr/local/bin/ \;
popd
