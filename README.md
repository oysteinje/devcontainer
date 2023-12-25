# Quickstart 

## Requiements 

* Docker
* Visual Studio Code or [devcontainer-cli](https://github.com/devcontainers/cli)

## To connect to the container from vscode 

```
Dev Containers: Open Folder in Container
```

## Whenever you do a change to Dockerfile or .devcontainer 

```vscode
Dev Containers: Rebuild Container
```

## How to use devcontainers outside vscode 

> The CLI requires Node.js 14.17.0 or later. 
> TIP: Use `nvm install node --reinstall-packages-from=$(nvm current)`

```sh
npm install -g @devcontainers/cli
```

```
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . pwsh
```
