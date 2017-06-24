## Dockerfiles

Dockerfiles collection for various applications based on [Fedora](_base).

### Container Setup

Containers can be installed on any host by executing the `INSTALL` label on the images  
and setting a few environment variables - compatible with the atomic CLI:

```bash
export IMAGE=oszi/toolbox # required
export NAME=toolbox # required
export CONFDIR=/etc/toolbox # optional
export DATADIR=/var/lib/toolbox # optional
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

The installers will only touch `CONFDIR` and/or `DATADIR` by design and they
will not create systemd unit files or kubernetes manifests...
The purpose of these installers is first-time setup for services inside
their containers, not orchestration.  
I recommend ansible playbooks for simple deployments.

Check out the `VOLUME` definitions in the Dockerfiles to find out where to
mount `CONFDIR` and/or `DATADIR` from the host filesystem.
Most services run as the `container` user defined in the base image.
