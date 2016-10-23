#!/bin/sh -u
. /etc/sysconfig/containers/unbound/unbound
exec docker exec -t -i ${NAME} unbound-control "$@"
