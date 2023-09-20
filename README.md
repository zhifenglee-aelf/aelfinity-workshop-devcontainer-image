# aelfinity workshop devcontainer image

## Setup

- Install Docker
- Run Docker
- Install nodejs
- Install the cli using `npm install -g @devcontainers/cli`

## Building and pushing the image

```bash
docker buildx create --platform linux/arm64/v8,linux/amd64 --use
devcontainer build --workspace-folder . --platform linux/arm64/v8,linux/amd64 --image-name yongenaelf/aelfinity-workshop --push true
```

## References

[Dev Containers CLI](https://github.com/devcontainers/cli)
