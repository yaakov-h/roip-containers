#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)
docker build ${BASEDIR} -t registry.yaakov.online/public/roip/analog-reflector:$COMMIT
