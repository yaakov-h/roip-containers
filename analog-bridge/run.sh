#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker run --rm -it --mount type=bind,source=${BASEDIR}/example-config,target=/config,readonly registry.yaakov.online/public/roip-analog-bridge:$COMMIT
