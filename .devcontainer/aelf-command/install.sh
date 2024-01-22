#!/bin/sh
set -e

echo "Activating feature 'aelf-command'"

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

# https://github.com/nodesource/distributions?tab=readme-ov-file#using-debian-as-root-3
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
apt-get install -y nodejs

npm i -g aelf-command@$VERSION