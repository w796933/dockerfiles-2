## docker-samba

Docker image for [Samba](https://www.samba.org) servers and clients.

## Notes

* Environment variables will be parsed as options:
* Prefix with SMBD_ for smbd, NMBD_ for nmbd or SAMBA_ for both.
* For NMBD you will need `host` network mode and the `NET_RAW` capability.
* Logs are redirected to stdout.
