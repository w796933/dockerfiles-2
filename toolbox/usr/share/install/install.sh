#!/bin/bash -eu
mv -v ${ENVFILE} $(dirname ${ENVFILE})/${INAME} 2> /dev/null || :
# There can be only one!
