#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker push registry.yaakov.online/public/roip-analog-reflector:$COMMIT
docker image tag registry.yaakov.online/public/roip-analog-reflector:$COMMIT registry.yaakov.online/public/roip-analog-reflector:latest
docker push registry.yaakov.online/public/roip-analog-reflector:latest

