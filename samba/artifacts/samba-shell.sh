#!/bin/sh -u
. /etc/sysconfig/containers/samba/samba
exec docker exec -t -i ${NAME} "$@"
