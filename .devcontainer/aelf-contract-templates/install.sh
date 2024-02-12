#!/bin/sh
set -e

echo "Activating feature 'aelf-contract-templates'"

VERSION=${VERSION:-undefined}
echo "The provided version is: $VERSION"

mkdir -p $HOME/LocalNuget
dotnet nuget add source $HOME/LocalNuget -n LocalNuget

ACS_DIR=$HOME/aelf-proto/Protobuf
mkdir -p $ACS_DIR
curl -O --output-dir $ACS_DIR https://raw.githubusercontent.com/AElfProject/AElf/dev/protobuf/acs12.proto
echo "The path of acs is: $ACS_DIR"

AELF_TOOLS_VERSION=1.0.5
AELF_TOOLS_BRANCH=feature/acs
AELF_TOOLS_TARGET_PATH=/aelf-tools
git clone -b $AELF_TOOLS_BRANCH https://github.com/AElfProject/aelf-developer-tools.git $HOME$AELF_TOOLS_TARGET_PATH
dotnet pack -c Release -o $HOME $HOME$AELF_TOOLS_TARGET_PATH/aelf.tools/AElf.Tools -p:Version=$AELF_TOOLS_VERSION
dotnet nuget push $HOME/AElf.Tools.1.0.5.nupkg -s LocalNuget

CONTRACT_TEMPLATE_VERSION=1.0.0
CONTRACT_TEMPLATE_BRANCH=feature/acs-template
CONTRACT_TEMPLATE_TARGET_PATH=/aelf-template
git clone -b $CONTRACT_TEMPLATE_BRANCH https://github.com/AElfProject/aelf-developer-tools.git $HOME$CONTRACT_TEMPLATE_TARGET_PATH
dotnet pack -c Release -o $HOME $HOME$CONTRACT_TEMPLATE_TARGET_PATH/templates -p:Version=$CONTRACT_TEMPLATE_VERSION
dotnet nuget push $HOME/AElf.ContractTemplates.1.0.0.nupkg -s LocalNuget

if [ $VERSION = "latest" ]; then
    dotnet new --install AElf.ContractTemplates
else
    dotnet new --install AElf.ContractTemplates::$VERSION
fi