#!/bin/bash

VER="v1.7"

ARCH=$(uname -m)
VDIS="64"

if [[ "$ARCH" == "i686" ]] || [[ "$ARCH" == "i386" ]]; then
  VDIS="32"
elif [[ "$ARCH" == *"armv7"* ]]; then
  VDIS="arm"
elif [[ "$ARCH" == *"armv8"* ]]; then
  VDIS="arm64"
fi

DOWNLOAD_LINK="https://github.com/v2ray/v2ray-core/releases/download/${VER}/v2ray-linux-${VDIS}.zip"

rm -rf /tmp/v2ray
mkdir -p /tmp/v2ray

curl -L -o "/tmp/v2ray/v2ray.zip" ${DOWNLOAD_LINK}
unzip "/tmp/v2ray/v2ray.zip" -d "/tmp/v2ray/"

# Create folder for V2Ray log
mkdir -p /var/log/v2ray

# Install V2Ray binary to /usr/bin/v2ray
mkdir -p /usr/bin/v2ray
cp "/tmp/v2ray/v2ray-${VER}-linux-${VDIS}/v2ray" "/usr/bin/v2ray/v2ray"
chmod +x "/usr/bin/v2ray/v2ray"

# Install V2Ray server config to /etc/v2ray
mkdir -p /etc/v2ray
if [ ! -f "/etc/v2ray/config.json" ]; then
  # cp "/tmp/v2ray/v2ray-${VER}-linux-${VDIS}/vpoint_vmess_freedom.json" "/etc/v2ray/config.json"
  cp "/usr/v2ray/config.json" "/etc/v2ray/config.json"
fi
