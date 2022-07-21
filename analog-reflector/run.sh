#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

if [ ! -f ${BASEDIR}/example-config/ssl/dvswitch.crt ]; then
    echo Generating self-signed certificates
    mkdir -p ${BASEDIR}/example-config/ssl
    (cd ${BASEDIR}/example-config/ssl && ${BASEDIR}/src/opt/Analog_Reflector/ssl/mkcerts.sh)
fi

docker run --rm -it --mount type=bind,source=${BASEDIR}/example-config,target=/config,readonly registry.yaakov.online/public/roip-analog-reflector:$COMMIT
