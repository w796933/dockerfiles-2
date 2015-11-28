## docker-toolbox

Swiss army knife for debugging and managing container hosts.

## Usage

Start Toolbox with NET_ADMIN and SYS_ADMIN capabilities:

```
docker run -it --rm --cap-add={NET_ADMIN,SYS_ADMIN} oszi/toolbox
```

Share a running container's volumes, network and IPC namespaces:

```
--volumes-from="$1" --{net,ipc}="container:$1"
```

Share everything from the host system:

```
-v /:/host --{net,ipc,pid,uts}=host --security-opt=label:disable
```

There are useful aliases in [toolbox-aliases.sh](rootfs/usr/share/install/toolbox-aliases.sh)
and [profile.d](rootfs/etc/profile.d) ...

## Install

```
atomic install oszi/toolbox
```

Manually on any distribution:

```
export IMAGE="oszi/toolbox"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
