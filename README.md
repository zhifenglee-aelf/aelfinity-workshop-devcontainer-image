# aelfinity workshop devcontainer image

## Setup

- Install Docker
- Run Docker
- Install nodejs
- Install the cli using `npm install -g @devcontainers/cli`

## Building the image

```bash
devcontainer build --workspace-folder . --push false --image-name aelfinity-workshop
```

## Building and pushing the image

```bash
devcontainer build --workspace-folder . --push true --image-name aelfinity-workshop
```
