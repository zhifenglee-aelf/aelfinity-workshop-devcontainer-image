#!/bin/sh
set -e

echo "Activating feature 'aelf-deploy'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

dotnet tool install --global aelf.deploy --version $VERSION