## docker-toolbox

Swiss army knife for debugging and managing container hosts.

## Usage

[Script](artifacts/toolbox-host.sh) for super-privileged containers:

```
toolbox-host.sh [command]
```

[Script](artifacts/toolbox-attach.sh) for attaching to other containers:

```
toolbox-attach.sh container [run-opts] [command]
```

[Script](artifacts/toolbox.sh) for running non-privileged containers:

```
toolbox.sh [:tag] [run-opts] [command]
```

Please note that spaces in run options are not handled properly.

## Pwnie

Included tools for penetration testing and CTFs:

**Binary**

* [american-fuzzy-lop](http://lcamtuf.coredump.cx/afl/)
* [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
* [pwntools](https://github.com/Gallopsled/pwntools)
* [peda](https://github.com/zachriggle/peda)
* [preeny](https://github.com/zardus/preeny)

**Crypto**

* [HashPump](https://github.com/bwall/HashPump)
* [xortool](https://github.com/hellman/xortool)
* [z3](https://github.com/Z3Prover/z3)

**Web**

* [sqlmap](https://github.com/sqlmapproject/sqlmap)
* [commix](https://github.com/stasinopoulos/commix)
* [weevely3](https://github.com/epinna/weevely3)
* [wuzz](https://github.com/asciimoo/wuzz)

Here be dragons!
