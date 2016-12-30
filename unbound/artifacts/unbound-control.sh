#!/bin/sh -u
. /etc/sysconfig/containers/unbound
exec docker exec -t -i ${NAME} unbound-control "$@"
