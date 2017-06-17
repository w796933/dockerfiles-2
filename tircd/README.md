## docker-tircd

An ircd proxy to the Twitter API.

This is a legacy docker image for [tircd](https://code.google.com/p/tircd/).

## Install

```
atomic install --name=tircd oszi/tircd:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/tircd:$TAG NAME=tircd
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now ${NAME}
```
