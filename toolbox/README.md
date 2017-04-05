## docker-toolbox

Swiss army knife for debugging and managing container hosts.

## Usage

Start Toolbox with NET_ADMIN and SYS_ADMIN capabilities:

```
docker run -it --rm --cap-add={NET_ADMIN,SYS_ADMIN} oszi/toolbox:$TAG
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

## Pwnie

Included tools for penetration testing and CTFs:

Binary:

 * [american-fuzzy-lop](http://lcamtuf.coredump.cx/afl/), py-afl

 * [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)

 * [pwntools](https://github.com/Gallopsled/pwntools)

 * [peda](https://github.com/zachriggle/peda)

 * [preeny](https://github.com/zardus/preeny)

Crypto:

 * [HashPump](https://github.com/bwall/HashPump)

 * [xortool](https://github.com/hellman/xortool)

 * [z3](https://github.com/Z3Prover/z3)

Web:

 * [sqlmap](https://github.com/sqlmapproject/sqlmap)

 * [commix](https://github.com/stasinopoulos/commix)

 * [weevely3](https://github.com/epinna/weevely3)

Here be dragons!

## Install

```
atomic install oszi/toolbox:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/toolbox:$TAG NAME=toolbox
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
