#!/bin/sh

dotnet new --install AElf.ContractTemplates
mkdir workshop
cd workshop
dotnet new aelf
cd src
dotnet build
cd ../test
dotnet test
aelf-command -v