#!/bin/sh -u
. /etc/sysconfig/containers/samba
exec docker exec -t -i ${NAME} "$@"
