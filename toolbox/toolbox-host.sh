#!/bin/bash
"$(dirname "$(realpath "$0")")"/toolbox.sh \
--{net,ipc,pid,uts}=host -v /:/mnt/host -w /mnt/host
