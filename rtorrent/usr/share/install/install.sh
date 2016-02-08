#!/bin/bash -eu
rsync -av --ignore-existing /data/ ${HOST}/${DATADIR}/
