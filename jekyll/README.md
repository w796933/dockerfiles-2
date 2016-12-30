## docker-jekyll

Docker image for [Jekyll](https://github.com/jekyll/jekyll) development.

## Install

```
atomic install oszi/jekyll:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/jekyll:$TAG NAME=jekyll
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```
