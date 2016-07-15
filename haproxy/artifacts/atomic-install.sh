#!/bin/bash -eu
rsync -av --ignore-existing /etc/haproxy/ ${HOST}/${CONFDIR}/
