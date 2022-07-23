#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)
docker build --platform=linux/amd64 ${BASEDIR} -t registry.yaakov.online/public/roip-analog-bridge:$COMMIT
