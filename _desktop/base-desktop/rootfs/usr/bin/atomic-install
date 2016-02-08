#!/bin/bash -eu
INAME=$(echo ${IMAGE} | awk -F/ '{print $(NF)}')

if [[ ${INAME} =~ ':' ]]; then
  INAME=$(echo ${INAME} | cut -d: -f1)
else
  # If no image tag is specified, expose it.
  IMAGE="${IMAGE}:\${TAG}"
fi

pushd /usr/share/

# Copy desktop files, icons, ...
find . -name "*${INAME}*" > /tmp/files
rsync -av --files-from=/tmp/files --exclude-from=./install/ignore ./ ${HOST}/usr/local/share/

pushd ./install/

# Copy and parse launcher scripts
find . -type f -executable -exec cp -av "{}" ${HOST}/usr/local/bin/ \;
find ${HOST}/usr/local/bin/ -name "*${INAME}*" -exec sed -i "s;__IMAGE__;${IMAGE};g" "{}" \;

# Install systemd user services if any
find . -name "${INAME}*.service" -exec cp -av "{}" ${HOST}/etc/systemd/user/ \;

popd
popd
