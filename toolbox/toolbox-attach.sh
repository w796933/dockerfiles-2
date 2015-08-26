#!/bin/bash
"$(dirname "$(realpath "$0")")"/toolbox.sh \
--{net,ipc}="container:${!#}" --volumes-from="${!#}" "${@:1:$#-1}"
