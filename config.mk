REGISTRY:= docker.io/oszi
BASE    := fedora
OSREL   := 26
DIST    := fc$(OSREL)
ARCH    := x86_64

DOCKER  := docker
GIT     := git
YUM     := dnf

MASTER  ?= master
RELEASE ?= $(shell date '+%Y%m%d')
VARS    += REGISTRY BASE OSREL DIST ARCH RELEASE YUM

BFLAGS  += $(if $(findstring B,$(MAKEFLAGS)),--no-cache)
HEAD    := $(shell $(GIT) symbolic-ref --short HEAD)
SEDVARS  = sed '$(foreach x,$(VARS),s|$${$(x)}|$($(x))|g;)'
