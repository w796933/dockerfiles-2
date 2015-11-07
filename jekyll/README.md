## docker-jekyll

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/jekyll/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/jekyll)

Docker image for [Jekyll](https://github.com/jekyll/jekyll) development.

## Install

```
atomic install quay.io/oszi/jekyll
```

Manually on any distribution:

```
export IMAGE="quay.io/oszi/jekyll"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
