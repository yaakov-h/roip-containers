#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker run --rm -it registry.yaakov.online/public/roip-md380emulator:$COMMIT
