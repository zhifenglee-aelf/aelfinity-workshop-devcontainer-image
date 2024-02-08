#!/bin/sh
set -e

echo "Activating feature 'aelf-contract-templates'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

if [ $VERSION = "latest" ]; then
    dotnet new --install AElf.ContractTemplates
else
    dotnet new --install AElf.ContractTemplates::$VERSION
fi