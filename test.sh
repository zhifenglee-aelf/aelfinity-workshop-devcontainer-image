#!/bin/sh

mkdir workshop
cd workshop
dotnet new aelf
cd src
dotnet build
cd ../test
dotnet test
aelf-command -v