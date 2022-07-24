#!/bin/sh
BASEDIR=$(readlink -f $(dirname -- $0))
COMMIT=$(cd ${BASEDIR}/src && git rev-parse HEAD)

docker push registry.yaakov.online/public/roip-mmdvm-bridge:$COMMIT
docker image tag registry.yaakov.online/public/roip-mmdvm-bridge:$COMMIT registry.yaakov.online/public/roip-mmdvm-bridge:latest
docker push registry.yaakov.online/public/roip-mmdvm-bridge:latest
