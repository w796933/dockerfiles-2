REGISTRY:= docker.io/oszi
BASE    := fedora
OSREL   := 24
DIST    := fc$(OSREL)

VARS    := REGISTRY BASE OSREL DIST YUM
DOCKER  := docker
GIT     := git
YUM     := dnf

BFLAGS  := $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD    := $(shell $(GIT) symbolic-ref --short HEAD)
SEDVARS  = sed '$(foreach x,$(VARS),s|$${$(x)}|$($(x))|g;)'
