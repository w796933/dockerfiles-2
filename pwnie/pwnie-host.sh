#!/bin/bash
"$(dirname "$(realpath "$0")")"/pwnie.sh \
--{net,ipc,pid,uts}=host -v /:/host -w /host/"$HOME" "$@"
