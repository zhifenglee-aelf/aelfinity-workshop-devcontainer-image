# aelfinity workshop devcontainer image

## Setup

- Install Docker
- Run Docker
- Install nodejs
- Install the cli using `npm install -g @devcontainers/cli`

## Test on local

Open this folder in VS Code, then `Command+Shift+P` to open the Command Palette.

Type `reopen` and choose `Dev Containers: Reopen in Container`.

## Building and pushing the image

```bash
docker buildx create --platform linux/arm64/v8,linux/amd64 --use
devcontainer build --workspace-folder . --platform linux/arm64/v8,linux/amd64 --image-name yongenaelf/aelfinity-workshop --push true
```

## References

[Dev Containers CLI](https://github.com/devcontainers/cli)
