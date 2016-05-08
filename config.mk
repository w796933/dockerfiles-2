REGISTRY:= docker.io/oszi
BASE    := fedora
OSREL   := 23
DIST    := fc$(OSREL)

VARS    := REGISTRY BASE OSREL DIST
DOCKER  := docker
GIT     := git
SED     := sed

BFLAGS  := $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD    := $(shell $(GIT) symbolic-ref --short HEAD)
SEDVARS  = $(SED) '$(foreach x,$(VARS),s!$${$(x)}!$($(x))!g;)'
