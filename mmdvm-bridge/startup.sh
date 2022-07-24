#!/bin/sh
set +x

CONFIG_PATH=${CONFIG_PATH:-/config/MMDVM_Bridge.ini}
DVSWITCH=${DVSWITCH:-/config/DVSwitch.ini}

echo Transforming configuration file...

if [ ! -d /opt/MMDVM_Bridge ]; then
    mkdir /opt/MMDVM_Bridge
fi

if [ ! -d /var/log/mmdvm ]; then
    mkdir /var/log/mmdvm
fi

cat $CONFIG_PATH | envsubst > /opt/MMDVM_Bridge/MMDVM_Bridge.ini
cat $DVSWITCH | envsubst > /opt/MMDVM_Bridge/DVSwitch.ini

echo Starting MMDVM Bridge...
ARCHITECTURE=$(arch)

if [ "${ARCHITECTURE}" = "aarch64" ]; then
    ARCHITECTURE="arm64";
fi
if [ "${ARCHITECTURE}" = "x86_64" ]; then
    ARCHITECTURE="amd64";
fi

export DVSWITCH=/opt/MMDVM_Bridge/DVSwitch.ini
/bin/MMDVM_Bridge.${ARCHITECTURE} /opt/MMDVM_Bridge/MMDVM_Bridge.ini
