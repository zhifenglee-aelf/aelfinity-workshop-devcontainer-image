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
docker buildx create --platform linux/amd64 --use
devcontainer build --workspace-folder . --platform linux/amd64 --image-name yongenaelf/aelfinity-workshop --push true
```

## Testing the image

```bash
cd test
code .
```

Type `Command+Shift+P` to open the Command Palette.

Type `reopen` and choose `Dev Containers: Reopen in Container`.

## Troubleshooting

### ERROR: docker exporter does not currently support exporting manifest lists

https://github.com/docker/buildx/issues/59#issuecomment-1869840317

In Docker Desktop, enable "User containerd for pulling and storing images" in Settings > Features in development > Beta features

## References

[Dev Containers CLI](https://github.com/devcontainers/cli)
