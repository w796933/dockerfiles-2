## docker-toolbox

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/toolbox/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/toolbox)

Swiss army knife for debugging and managing container hosts.

## Usage

Start Toolbox with NET_ADMIN and SYS_ADMIN capabilities:

```
docker run -it --rm --cap-add={NET_ADMIN,SYS_ADMIN} quay.io/oszi/toolbox
```

Share a running container's volumes, network and IPC namespaces:

```
--volumes-from="$1" --{net,ipc}="container:$1"
```

Share everything from the host system:

```
-v /:/host --{net,ipc,pid,uts}=host --security-opt=label:disable
```

Docker and rkt are automatically chrooted into /host.

There are useful aliases in [aliases.sh](include/usr/share/install/aliases.sh)
and [profile.d](include/etc/profile.d) ...

## Install

```
atomic install quay.io/oszi/toolbox
```

Manually on any distribution:

```
export IMAGE="quay.io/oszi/toolbox"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
