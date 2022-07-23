#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker push registry.yaakov.online/public/roip-analog-bridge:$COMMIT
docker image tag registry.yaakov.online/public/roip-analog-bridge:$COMMIT registry.yaakov.online/public/roip-analog-bridge:latest
docker push registry.yaakov.online/public/roip-analog-bridge:latest
