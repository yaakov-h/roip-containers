#!/bin/sh
set +x

echo Transforming configuration file...

CONFIG_PATH=${CONFIG_PATH:-/config/Analog_Reflector.yaml}
cat $CONFIG_PATH | envsubst | yq eval -o=json > /opt/Analog_Reflector/Analog_Reflector.json

echo Starting Analog Reflector...
ARCHITECTURE=$(arch)

if [ "${ARCHITECTURE}" = "aarch64" ]; then
    ARCHITECTURE="arm64";
fi
if [ "${ARCHITECTURE}" = "x86_64" ]; then
    ARCHITECTURE="amd64";
fi

/bin/Analog_Reflector.${ARCHITECTURE} -f /opt/Analog_Reflector/Analog_Reflector.json
