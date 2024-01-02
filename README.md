# Quickstart 

## Requirements 

* Docker
* Visual Studio Code or [devcontainer-cli](https://github.com/devcontainers/cli)

## To connect to the container from *vscode* 

```
Dev Containers: Open Folder in Container
```

### Whenever you do a change to Dockerfile or .devcontainer 

```vscode
Dev Containers: Rebuild Container
```

## How to use devcontainers *outside* vscode 

> The CLI requires Node.js 14.17.0 or later. 
> TIP: Use `nvm install node --reinstall-packages-from=$(nvm current)`

```sh
npm install -g @devcontainers/cli
```

```sh
devcontainer up --workspace-folder . --remove-existing-container
devcontainer exec --workspace-folder . pwsh
```

If you have made changes to the Dockerfile, then run the following:
``` sh
devcontainer up --workspace-folder . --remove-existing-container --build-no-cache
```

