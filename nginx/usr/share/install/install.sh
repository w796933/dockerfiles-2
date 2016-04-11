#!/bin/bash -eu
rsync -av --ignore-existing /etc/nginx/ ${HOST}/${CONFDIR}/
