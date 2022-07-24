#!/bin/sh
set +x

CONFIG_PATH=${CONFIG_PATH:-/config/Analog_Bridge.ini}

echo Transforming configuration file...

if [ ! -d /opt/Analog_Bridge ]; then
    mkdir /opt/Analog_Bridge
fi

cat $CONFIG_PATH | envsubst > /opt/Analog_Bridge/Analog_Bridge.ini

echo Starting Analog Bridge...
ARCHITECTURE=$(arch)

if [ "${ARCHITECTURE}" = "aarch64" ]; then
    ARCHITECTURE="arm64";
fi
if [ "${ARCHITECTURE}" = "x86_64" ]; then
    ARCHITECTURE="amd64";
fi

/bin/Analog_Bridge.${ARCHITECTURE} /opt/Analog_Bridge/Analog_Bridge.ini
