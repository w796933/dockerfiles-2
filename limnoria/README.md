## docker-limnoria

[Limnoria](https://github.com/ProgVal/Limnoria) IRC bot, a fork of Supybot.

Additional plugins are included from [ProgVal](https://github.com/ProgVal/Supybot-plugins)
and [GLolol](https://github.com/GLolol/SupyPlugins).

## Usage

List all available plugins:

```
docker run -t --rm --entrypoint ls oszi/limnoria:$TAG /usr/src/limnoria/plugins/
```

## Install

```
atomic install --name=mybot oszi/limnoria:$TAG
```

Manually on any distribution:

```
export IMAGE=oszi/limnoria:$TAG NAME=mybot
docker pull ${IMAGE}
eval $(docker inspect -f {{.Config.Labels.INSTALL}} ${IMAGE})
```

```
systemctl enable --now limnoria@mybot
```
