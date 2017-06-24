## docker-plex-server

[Plex](https://plex.tv) organizes your video, music and photo collections
and streams them to all of your screens.

## Notes

* The default published port is 32400.
* You can access the web server at `http://<server>:32400/web/`.
* For DLNA and discovery you will need `host` network mode and the `NET_RAW` capability.

You can use an SSH tunnel for first-time setup without host network mode:

```
ssh -L 32400:<container-ipv4>:32400 server
```

Customize the following Network and Transcoder settings:

* List of networks that are allowed without auth! (e.g.: `172.16.0.0/12`)
* Custom server access URLs! (e.g.: `http://<local>:32400,https://<remote>:32400`)
* Transcoder temporary directory (e.g.: `/data/Transcoder`)
