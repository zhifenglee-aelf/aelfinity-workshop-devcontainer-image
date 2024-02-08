#!/bin/sh
set -e

echo "Activating feature 'aelf-contract-templates'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

ACS_DIR=$HOME/aelf-acs/Protobuf
mkdir -p $ACS_DIR
curl -O --output-dir $ACS_DIR https://raw.githubusercontent.com/AElfProject/AElf/dev/protobuf/acs12.proto

if [ $VERSION = "latest" ]; then
    dotnet new --install AElf.ContractTemplates
else
    dotnet new --install AElf.ContractTemplates::$VERSION
fi