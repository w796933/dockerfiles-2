## docker-syncthing

[![Docker Repository on Quay.io](https://quay.io/repository/nightling/syncthing/status "Docker Repository on Quay.io")](https://quay.io/repository/nightling/syncthing)

[Syncthing](https://syncthing.net): Open Source Continuous File Synchronization

## Usage

```
docker run --rm quay.io/nightling/syncthing --help
```

 * [Getting Started Guide](http://docs.syncthing.net/intro/getting-started.html)

## Example

```
docker run --rm --name sync-$USER -u $UID:$GID --net host --cap-drop ALL \
-v "$HOME"/.config/syncthing:/data/.config/syncthing \
-v "$HOME"/Documents:/data/Documents \
-v "$HOME"/Sync:/data/Sync \
quay.io/nightling/syncthing
```
