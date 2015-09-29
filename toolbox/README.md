## docker-toolbox

[![Docker Repository on Quay.io](https://quay.io/repository/nightling/toolbox/status "Docker Repository on Quay.io")](https://quay.io/repository/nightling/toolbox)

Swiss army knife for debugging and managing container hosts.

## Usage

Start Toolbox with NET_ADMIN and SYS_ADMIN capabilities:

```
docker run -it --rm --cap-add={NET_ADMIN,SYS_ADMIN} quay.io/nightling/toolbox
```

Share a running container's volumes, network and IPC namespaces:

```
--volumes-from="$1" --{net,ipc}="container:$1"
```

Share everything from the host system:

```
-v /:/host --{net,ipc,pid,uts}=host --security-opt=label:disable
```
