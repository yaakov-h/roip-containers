#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker push registry.yaakov.online/public/roip-md380emulator:$COMMIT
docker image tag registry.yaakov.online/public/roip-md380emulator:$COMMIT registry.yaakov.online/public/roip-md380emulator:latest
docker push registry.yaakov.online/public/roip-md380emulator:latest
