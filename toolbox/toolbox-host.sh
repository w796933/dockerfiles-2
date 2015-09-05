#!/bin/bash
"$(dirname "$(realpath "$0")")"/toolbox.sh \
--{net,ipc,pid,uts}=host -v /:/host -w /host "$@"
