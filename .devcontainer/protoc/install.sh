#!/bin/sh
set -e

echo "Activating feature 'protoc'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

# https://github.com/devcontainers/features/blob/562305d37b97d47331d96306ffc2a0a3cce55e64/src/rust/install.sh#L116C8-L122
apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# https://github.com/devcontainers/features/blob/562305d37b97d47331d96306ffc2a0a3cce55e64/src/rust/install.sh#L132-L153
export DEBIAN_FRONTEND=noninteractive

# Install curl if missing
if ! dpkg -s curl > /dev/null 2>&1; then
    apt_get_update
    apt-get -y install --no-install-recommends curl
fi

architecture="$(dpkg --print-architecture)"
download_architecture="${architecture}"
case ${download_architecture} in
 amd64) 
    download_architecture="x86_64"
    ;;
 arm64) 
    download_architecture="aarch_64"
    ;;
 *) echo "(!) Architecture ${architecture} not supported."
    exit 1
    ;;
esac

# https://grpc.io/docs/protoc-installation/#install-pre-compiled-binaries-any-os
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/v$VERSION/protoc-$VERSION-linux-$download_architecture.zip
unzip protoc-$VERSION-linux-$download_architecture.zip -d $HOME/.local