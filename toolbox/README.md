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
-v /:/host --{net,ipc,pid}=host --privileged
```

[Script](artifacts/toolbox-host.sh) for super-privileged containers:

```
toolbox-host [command]
```

[Script](artifacts/toolbox-attach.sh) for attaching to other containers:

```
toolbox-attach container [run-opts] [command]
```

[Script](artifacts/toolbox.sh) for running non-privileged containers:

```
toolbox [:tag] [run-opts] [command]
```

For example, to run docker on the latest image:

```
toolbox :latest -p=2375:2375 --privileged docker daemon -H=0.0.0.0:2375
```

Please note that spaces in run options are not handled properly.

Aliases in [docker_aliases.sh](etc/profile.d/docker_aliases.sh) will also be installed.

## Install

```
atomic install oszi/toolbox
```

Manually on any distribution:

```
export IMAGE=oszi/toolbox NAME=toolbox
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
