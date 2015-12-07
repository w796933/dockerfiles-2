## docker-pwnie

Docker image for penetration testing and CTFs, built on the [toolbox](/toolbox) image.

Binary:

 * [american-fuzzy-lop](http://lcamtuf.coredump.cx/afl/), py-afl

 * [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)

 * [pwntools](https://github.com/Gallopsled/pwntools)

 * [peda](https://github.com/zachriggle/peda)

 * [preeny](https://github.com/zardus/preeny)

Crypto:

 * [HashPump](https://github.com/bwall/HashPump)

 * [xortool](https://github.com/hellman/xortool)

 * [z3](https://github.com/Z3Prover/z3)

Web:

 * [sqlmap](https://github.com/sqlmapproject/sqlmap)

 * [commix](https://github.com/stasinopoulos/commix)

 * [weevely3](https://github.com/epinna/weevely3)

Here be dragons!

## Install

```
atomic install oszi/pwnie
```

Manually on any distribution:

```
export IMAGE="oszi/pwnie"
docker pull ${IMAGE}
eval $(docker inspect -f "{{.Config.Labels.INSTALL}}" ${IMAGE})
```
