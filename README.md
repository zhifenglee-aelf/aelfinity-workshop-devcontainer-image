# aelfinity workshop devcontainer image

## Setup

- Install Docker
- Run Docker
- Install nodejs
- Install the cli using `npm install -g @devcontainers/cli`

## Building and pushing the image

```bash
devcontainer build --workspace-folder . --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --image-name aelf/aelfinity-workshop --push true
```

## References

[Dev Containers CLI](https://github.com/devcontainers/cli)

## Problems and solutions

### ERROR: multiple platforms feature is currently not supported for docker driver. Please switch to a different driver (eg. "docker buildx create --use")

As mentioned in the error, use this command before building:

```bash
docker buildx create --use
```
