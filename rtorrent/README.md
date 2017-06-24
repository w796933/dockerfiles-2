## docker-rtorrent

The [rTorrent] BitTorrent client with the [ruTorrent] WebUI.

[rTorrent]:https://github.com/rakshasa/rtorrent
[ruTorrent]:https://github.com/Novik/ruTorrent

## Notes

* The internal web server port is 80.
* Thus the `NET_BIND_SERVICE` capability is required.
* The default user:password is rtorrent:rtorrent in `/data/.htpasswd`.
* Set the `PORT_RANGE` and `DHT_PORT` env variables in place of rtorrent.rc.
* SSL should be configured by a reverse proxy for public access.
* All logs are redirected to stdout.
