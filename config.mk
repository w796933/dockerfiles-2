REGISTRY := docker.io/oszi
BASE     := fedora
OSREL    := 26
DIST     := fc$(OSREL)
ARCH     := x86_64

DOCKER   := docker
GIT      := git
YUM      := dnf

VARS     += REGISTRY BASE OSREL DIST ARCH YUM
SEDVARS   = sed '$(foreach x,$(VARS),s|$${$(x)}|$($(x))|g;)'
BFLAGS   += $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD     := $(shell $(GIT) symbolic-ref --short HEAD)
