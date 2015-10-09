## docker-miniircd

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/miniircd/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/miniircd)

[miniircd](https://github.com/jrosdahl/miniircd) is a small and limited IRC server written in Python.
Despite its size, it is a functional alternative to a full-blown ircd for private or internal use.
Installation is simple; no configuration is required.

## Usage

Start miniircd with the default options:

```
docker run --rm --name miniircd -p 6667:6667 quay.io/oszi/miniircd
```

List all available options:

```
docker run --rm quay.io/oszi/miniircd --help
```
