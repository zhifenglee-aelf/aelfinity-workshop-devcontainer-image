FROM alpine
RUN apk add --update nodejs npm dotnet7-sdk protobuf-dev
RUN npm install -g aelf-command
RUN dotnet new install AElf.ContractTemplates
RUN mkdir -p /root/.nuget/packages/aelf.tools/1.0.2/tools/linux_arm64
CMD ["cp", "protoc", "/root/.nuget/packages/aelf.tools/1.0.2/tools/linux_arm64"]