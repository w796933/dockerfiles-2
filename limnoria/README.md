## docker-limnoria

[Limnoria](https://github.com/ProgVal/Limnoria) IRC bot, a fork of Supybot.

Additional plugins are included from [ProgVal](https://github.com/ProgVal/Supybot-plugins)
and [GLolol](https://github.com/GLolol/SupyPlugins).

## Usage

If you mount /data yourself, it must be writable by the container user:

```
docker run --rm --entrypoint sh nightling/limnoria -c id
```

Interactive first time configuration:

```
docker run -it --rm -v /path/to/supy:/data nightling/limnoria supybot-wizard --allow-home
```

List all available plugins:


```
docker run -it --rm nightling/limnoria ls /opt/limnoria/plugins/
```

Start Limnoria with your existing configuration:

```
docker run --rm --name supy -v /path/to/supy:/data nightling/limnoria supybot <name>.conf
```
